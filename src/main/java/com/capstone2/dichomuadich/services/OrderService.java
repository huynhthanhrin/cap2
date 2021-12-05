package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Order;

import com.capstone2.dichomuadich.domain.User;

import java.util.List;



public interface OrderService {

    Order save(Order order);

    List<Order> findOrdersByUser(User user);

    int updateOrderStatus(int status, int order);

    List<Order> findOrderByUser(User user);

    List<Order> findAll();



}
