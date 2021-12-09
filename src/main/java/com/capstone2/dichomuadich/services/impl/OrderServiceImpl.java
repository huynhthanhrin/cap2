package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.User;

import com.capstone2.dichomuadich.repository.OrderRepository;
import com.capstone2.dichomuadich.services.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    OrderRepository orderRepository;

    @Override
    public Order save(Order order) {
        return orderRepository.save(order);
    }


    @Override
    public List<Order> findOrdersByUser(User user) {
        return orderRepository.findOrdersByUser(user);
    }

    @Override
    public int updateOrderStatus(int status, int order) {
        return orderRepository.updateOrderStatus(status, order);
    }

    @Override
    public int updateOrderStatusPayment(int status, int order) {
        return orderRepository.updateOrderStatusPayment(status,order);
    }

    @Override
    public List<Order> findOrderByUser(User user) {
        return orderRepository.findOrderByUser(user);
    }

    @Override
    public List<Order> findAll() {
        return orderRepository.findAll();
    }

    @Override
    public Order findOrderByOrderId(int id) {
        return orderRepository.findOrderByOrderId(id);
    }


}
