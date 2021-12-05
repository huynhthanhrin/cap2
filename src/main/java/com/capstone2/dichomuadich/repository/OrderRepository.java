package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface OrderRepository extends JpaRepository<Order, Integer> {

    List<Order> findOrdersByUser(User user);

    @Modifying
    @Query(value = "update order_tb set status = ? where orderId = ?", nativeQuery = true)
    @Transactional
    int updateOrderStatus(int status, int orderId);

    List<Order> findOrderByUser(User user);

    List<Order> findAll();


}
