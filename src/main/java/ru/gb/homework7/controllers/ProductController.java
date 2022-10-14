package ru.gb.homework7.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import ru.gb.homework7.entities.Product;
import ru.gb.homework7.services.ProductService;

import java.util.Optional;

@RestController
@RequestMapping("/")
public class ProductController {

    ProductService productService;

    @Autowired
    public void setProductService(ProductService productService) {
        this.productService = productService;
    }

    @GetMapping("/products")
    public String findAll() {
        return productService.findAll().toString();
    }

    @GetMapping("/products/{id}")
    public Product findById(@PathVariable Long id) {
        System.out.println(id);
        Optional<Product> product = productService.findById(id);
        return product.get();
    }

    @PostMapping(value = "/products")
    public ResponseEntity<?> addProduct(@RequestBody Product product) {
        productService.addProduct(product);
        return ResponseEntity.ok().body(HttpStatus.OK);
    }

    @GetMapping("/products/delete/{id}")
    public String deleteProduct(@PathVariable Long id) {
        productService.deleteProduct(id);
        return "deleted";
    }

}
