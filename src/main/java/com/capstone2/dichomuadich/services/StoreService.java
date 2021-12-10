package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;

import java.util.List;

public interface StoreService {

    List<Store> getAll();

    Store save(Store store);

    Store findByStoreName(String name);

    Store findStoreByStoreId(int id);

    void delete(Integer id);

    void deactiveStore(int storeId);
}
