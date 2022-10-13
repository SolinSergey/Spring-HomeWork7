package ru.gb.homework7.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import ru.gb.homework7.entities.Product;
import ru.gb.homework7.services.ProductService;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/product")
public class ProductController {

    ProductService productService;

    @Autowired
    public void setProductService(ProductService productService){
        this.productService=productService;
    }

    @GetMapping("/find_all")
    public String findAll(){
     return productService.findAll().toString();
    }

    @GetMapping("/find_by_id")
    public Product findById(@RequestParam Long id){
        System.out.println(id);
        Optional<Product> product=productService.findById(id);
        return product.get();
    }

    @GetMapping("/show_form")
    public String showFormAddProduct(Model model){
        Product product=new Product();
        model.addAttribute(product);
        return "productform";
    }

    @PostMapping(value="/add_product")
    public ResponseEntity<?> addProduct (@RequestBody Product product){
        productService.addProduct(product);
        return ResponseEntity.ok().body(HttpStatus.OK);
    }

}
