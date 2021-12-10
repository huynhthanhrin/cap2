package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Repository
public interface StoreRepository extends JpaRepository<Store, Integer> {

    Store findStoreByStoreName(String storeName);

    Store findStoreByStoreId(int id);

    @Query(value = "UPDATE store set status = 0 where storeId = ?", nativeQuery = true)
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Transactional
    void deactiveStore(int storeId);

    @Query(value = "select * from store where status = 1", nativeQuery = true)
    List<Store> findAll();

}
