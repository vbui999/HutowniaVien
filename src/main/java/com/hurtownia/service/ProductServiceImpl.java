package com.hurtownia.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.hurtownia.model.Product;
import com.hurtownia.repository.ProductRepository;

@Service
@Transactional
public class ProductServiceImpl implements ProductService {

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
	public Product getProductByPath(String path) {

		return productRepository.findProductByUniquename(path);
	}

	@Override
	public void saveOrUpdate(Product Product) {
		productRepository.save(Product);
	}

	@Override
	public void deleteProduct(long id) {
		productRepository.deleteById(id);
	}

	@Override
	public List<Product> findAllActivatedDesc() {
		return (List<Product>) productRepository.findAllByisactivatedOrderByIdDesc(1);
	}

	@Override
	public List<Product> findAllDesc() {
		return (List<Product>) productRepository.findAllByOrderByIdDesc();
	}

	@Override
	public Page<Product> listAll(int pageNum, String sortField, String sortDir) {

		Pageable pageable = PageRequest.of(pageNum - 1, 10, sortDir.equals("asc") ? Sort.by(sortField).ascending() : Sort.by(sortField).descending());

		return (Page<Product>) productRepository.findAll(pageable);
	}

	@Override
	public Page<Product> listAllActivated(int pageNum, String sortField, String sortDir) {
		Pageable pageable = PageRequest.of(pageNum - 1, 10, sortDir.equals("asc") ? Sort.by(sortField).ascending() : Sort.by(sortField).descending());
		return (Page<Product>) productRepository.findByisactivated(1, pageable);
	}

	@Override
	public Page<Product> listAllActivatedOrderByIdDesc(int pageNum) {
		Pageable pageable = PageRequest.of(pageNum - 1, 20);
		return (Page<Product>) productRepository.findByisactivatedOrderByIdDesc(1, pageable);
	}

	@Override
	public Page<Product> listAllActivatedInCategoryOrderbyIdDesc(long cateid, int pageNum) {
		Pageable pageable = PageRequest.of(pageNum - 1, 15);
		return (Page<Product>) productRepository.findByIsactivatedAndCategoryidOrderByIdDesc(1, cateid, pageable);
	}

	@Override
	public Page<Product> listAllActivatedInCategoryAndTypeOrderbyIdDesc(long cateid, String type, int pageNum) {

		Pageable pageable = PageRequest.of(pageNum - 1, 15);
		return (Page<Product>) productRepository.findByIsactivatedAndCategoryidAndTypeOrderByIdDesc(1, cateid, type, pageable);
	}

	@Override
	public List<Product> ListTop5ActivatedInCategoryAndTypeOrderbyIdDesc(long cateId, String type) {

		return productRepository.findTop5ByIsactivatedAndCategoryidAndTypeOrderByIdDesc(1, cateId, type);
	}

	@Override
	public List<Product> ListTop5ActivatedDesc() {
		return productRepository.findTop5ByIsactivatedOrderByIdDesc(1);
	}

}
