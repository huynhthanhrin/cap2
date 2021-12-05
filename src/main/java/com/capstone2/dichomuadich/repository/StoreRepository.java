package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {

    Store findStoreByStoreName(String storeName);

    Store findStoreByStoreId(int id);
}
