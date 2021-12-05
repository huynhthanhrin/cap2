package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Role;

import java.util.List;

public interface RoleService {

    List<Role> findAll();

    Role findRoleByRoleId(int roleId);
}
