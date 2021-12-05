package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;

import java.util.List;

public interface OrderItemService {

    OrderItems save(OrderItems orderItems);

    List<OrderItems> findOrderItemsByOrder(Order order);
}
