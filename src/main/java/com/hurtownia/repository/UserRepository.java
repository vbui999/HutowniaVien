package com.hurtownia.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.hurtownia.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUsername(String username);
}
