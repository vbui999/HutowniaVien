package com.hurtownia.service;

import java.util.List;

import org.springframework.data.domain.Page;

import com.hurtownia.model.Product;

public interface ProductService {

	public List<Product> getAllProducts();

	public List<Product> findAllActivatedDesc();

	public List<Product> findAllDesc();

	public Product getProductById(long id);

	public Product getProductByPath(String path);

	public void saveOrUpdate(Product product);

	public void deleteProduct(long id);

	public Page<Product> listAll(int pageNum, String sortField, String sortDir);

	public Page<Product> listAllActivated(int pageNum, String sortField, String sortDir);

	public Page<Product> listAllActivatedOrderByIdDesc(int pageNum);

	public Page<Product> listAllActivatedInCategoryOrderbyIdDesc(long cateId, int pageNum);

	public Page<Product> listAllActivatedInCategoryAndTypeOrderbyIdDesc(long cateId, String type, int pageNum);

	public List<Product> ListTop5ActivatedInCategoryAndTypeOrderbyIdDesc(long cateId, String type);

	public List<Product> ListTop5ActivatedDesc();
}
