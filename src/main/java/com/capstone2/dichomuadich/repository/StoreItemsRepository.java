package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.OrderItems;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;

public interface StoreItemsRepository extends JpaRepository<Store, Integer> {

}
