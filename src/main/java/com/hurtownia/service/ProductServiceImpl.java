package com.hurtownia.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hurtownia.model.Product;
import com.hurtownia.repository.ProductRepository;

@Service
@Transactional
public class ProductServiceImpl implements ProductService{

	@Autowired
	ProductRepository productRepository;
	
	 @Override
	 public List<Product> getAllProducts() {
	  return (List<Product>) productRepository.findAll();
	 }

	 @Override
	 public Product getProductById(long id) {
	  return productRepository.findById(id).get();
	 }

	 @Override
	 public void saveOrUpdate(Product Product) {
	  productRepository.save(Product);
	 }
	 

	 @Override
	 public void deleteProduct(long id) {
	  productRepository.deleteById(id);
	 }

	
}
