package com.hurtownia.repository;

import org.springframework.data.repository.CrudRepository;

import com.hurtownia.model.Product;

public interface ProductRepository extends CrudRepository<Product, Long>{

}
