package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.repository.OrderItemsRepository;
import com.capstone2.dichomuadich.services.OrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderItemsServiceImpl implements OrderItemService {

    @Autowired
    OrderItemsRepository orderItemsRepository;

    @Override
    public OrderItems save(OrderItems orderItems) {
        return orderItemsRepository.save(orderItems);
    }

    @Override
    public List<OrderItems> findOrderItemsByOrder(Order order) {
        return orderItemsRepository.findOrderItemsByOrder(order);
    }
}
