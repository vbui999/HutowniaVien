package com.hurtownia.repository;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import com.hurtownia.model.Product;

@org.springframework.stereotype.Repository
public interface ProductRepository extends JpaRepository<Product, Long> {

	Product findProductByUniquename(String path);

	List<Product> findAllByisactivatedOrderByIdDesc(int i);

	List<Product> findTop5ByIsactivatedOrderByIdDesc(int i);

	List<Product> findAllByOrderByIdDesc();

	List<Product> findTop5ByIsactivatedAndCategoryidAndTypeOrderByIdDesc(int i, long cateid, String type);

	Page<Product> findByisactivated(int i, Pageable pageable);

	Page<Product> findByisactivatedOrderByIdDesc(int i, Pageable pageable);

	Page<Product> findByIsactivatedAndCategoryidOrderByIdDesc(int i, long cateid, Pageable pageable);

	Page<Product> findByIsactivatedAndCategoryidAndTypeOrderByIdDesc(int i, long cateid, String type, Pageable pageable);

}
