package com.hurtownia.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hurtownia.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
