package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.domain.Role;
import org.springframework.data.jpa.repository.JpaRepository;

public interface RoleRepository extends JpaRepository<Role, Integer> {

    Role findRoleByRoleId(int roleId);
}
