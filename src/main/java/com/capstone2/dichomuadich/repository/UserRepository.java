package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Role;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Integer> {

    /**
     * TODO: Method description
     *
     * @param username
     * @return
     */
    User findUserByUsername(String username);
    User findUserByRememberToken(String rememberToken);

    List<User> findUsersByRole(Role role);


    @Query(value = "DELETE FROM user WHERE storeId  = ?", nativeQuery = true)
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Transactional
    void deleteUserByStoreID(int storeId);

    User findUserByUserId(Integer id);

    User findUserByUsernameAndPassword(String username, String password);

    @Query(value = "UPDATE user SET token = ? WHERE username = ?", nativeQuery = true)
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Transactional
    void updateToken(String token, String username);

}
