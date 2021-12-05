package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Order;
import com.capstone2.dichomuadich.domain.OrderItems;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;


@Repository
public interface OrderItemsRepository extends JpaRepository<OrderItems, Integer> {

    List<OrderItems> findOrderItemsByOrder(Order order);
}
