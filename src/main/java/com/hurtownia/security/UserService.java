package com.hurtownia.security;

import com.hurtownia.model.User;

public interface UserService {
    void save(User user);

    User findByName(String username);
}
