package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.details.CustomUserDetails;
import com.capstone2.dichomuadich.domain.User;
import com.capstone2.dichomuadich.utils.AuthenticateUtil;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userService.findByUsername(username);
        if (user == null) {
            throw new UsernameNotFoundException("Wrong username or password");
        } else if (user.getStatus() == 0) {
            throw new UsernameNotFoundException("Your account has not been activated or locked please check your email ");
        }
        return new CustomUserDetails(user);
    }

    /**
     * TODO: Method description
     *
     * @param id
     * @return
     */
    @Transactional
    public UserDetails loadUserById(int id) {
        User user = userService.findById(id);
        if (user == null) {
            throw new UsernameNotFoundException("User not found with id : " + id);
        }

        return new CustomUserDetails(user);
    }
}
