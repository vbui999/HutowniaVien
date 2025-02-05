package com.hurtownia.repository;

import org.springframework.data.repository.CrudRepository;
import com.hurtownia.model.Category;

public interface CategoryRepository extends CrudRepository<Category, Long>{
	Category findBycatefullname(String catefullname);
	Category findBycatename(String catename);
}
