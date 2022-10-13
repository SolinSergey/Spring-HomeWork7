package ru.gb.homework7.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ru.gb.homework7.entities.Product;

@Repository
public interface ProductRepository extends JpaRepository<Product,Long> {

}
