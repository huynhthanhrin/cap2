package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.repository.UserRepository;
import com.capstone2.dichomuadich.services.UserService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class UserServiceImpl implements UserService {

    @Autowired
    UserRepository userRepository;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public User findByUsername(String username) {
        try {
            return userRepository.findUserByUsername(username);
        } catch (Exception e) {
            log.error("Có lỗi xảy ra tại [findByUsername]", e);
        }
        return null;
    }

    @Override
    public User findById(int id) {
        return null;
    }

    @Override
    public List<User> findUsersByRole(Role role) {
        try {
            return userRepository.findUsersByRole(role);
        } catch (Exception e) {
            log.error("Có lỗi xảy ra tại [findByUsername]", e);
        }
        return null;
    }

    @Override
    public User save(User user) {
        try {
            return userRepository.save(user);
        } catch (Exception e) {
            log.error("Có lỗi xảy ra tại [save]", e);
        }
        return null;
    }

    @Override
    public void delete(Integer id) {
        try {
            userRepository.deleteById(id);
        } catch (Exception e) {
            log.error("Có lỗi xảy ra tại [save]", e);
        }
    }

    @Override
    public User findUserByUserId(Integer userId) {
        try {
            return  userRepository.findUserByUserId(userId);
        } catch (Exception e) {
            log.error("Có lỗi xảy ra tại [save]", e);
        };
        return null;
    }

    @Override
    public User findUserByUsernameAndPassword(String username, String password) {
        if (findByUsername(username) != null)
        {
            if (bCryptPasswordEncoder.matches(password, findByUsername(username).getPassword()))
            {
                password = findByUsername(username).getPassword();
            }
        }
        return userRepository.findUserByUsernameAndPassword(username, password);
    }

    @Override
    public void updateToken(String token, String name) {
        userRepository.updateToken(token, name);
    }

    @Override
    public List<User> findAll() {
        return userRepository.findAll();
    }

    @Override
    public void delUsersByStore(int storeId) {
        userRepository.deleteUserByStoreID(storeId);
    }
}
