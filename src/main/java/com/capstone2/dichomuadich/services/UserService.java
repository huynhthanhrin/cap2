package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;

import java.util.List;

public interface UserService {

    User findByUsername(String username);

    User findById(int id);

    List<User> findUsersByRole(Role role);

    User save(User user);

    void delete(Integer id);

    User findUserByUserId(Integer userId);

    User findUserByUsernameAndPassword(String username, String password);

    void updateToken(String token, String name);

    List<User> findAll();

    void delUsersByStore(int storeId);

    List<User> findUsersByStore(Store store);

    void updateStatus(int status, int userId);

}
