package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.repository.RoleRepository;
import com.capstone2.dichomuadich.services.RoleService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class RoleServiceImpl implements RoleService {

    @Autowired
    RoleRepository roleRepository;

    @Override
    public List<Role> findAll() {
        try {
            return roleRepository.findAll();
        } catch (Exception e) {
            log.error("Error at [findAll]", e);
        }
        return null;
    }

    @Override
    public Role findRoleByRoleId(int roleId) {
        try {
            return roleRepository.findRoleByRoleId(roleId);
        } catch (Exception e) {
            log.error("Error at [findAll]", e);
        }
        return null;
    }
}
