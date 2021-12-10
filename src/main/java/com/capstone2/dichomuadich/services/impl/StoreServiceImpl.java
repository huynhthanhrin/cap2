package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.repository.StoreRepository;
import com.capstone2.dichomuadich.services.StoreService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Slf4j
public class StoreServiceImpl implements StoreService {

    @Autowired
    StoreRepository storeRepository;


    @Override
    public List<Store> getAll() {
        try {
            return storeRepository.findAll();
        } catch (Exception e) {
            log.error("Error at [getAll]", e);
        }
        return null;
    }

    @Override
    public Store save(Store store) {
        return storeRepository.save(store);
    }

    @Override
    public Store findByStoreName(String name) {
        try {
            return storeRepository.findStoreByStoreName(name);
        } catch (Exception e) {
            log.error("Error at [findByStoreName]", e);
        }
        return null;
    }

    @Override
    public Store findStoreByStoreId(int id) {
        try {
            return storeRepository.findStoreByStoreId(id);
        } catch (Exception e) {
            log.error("Error at [FindStoreByStoreId]", e);
        }
        return null;
    }

    @Override
    public void delete(Integer id) {
        try {
            storeRepository.deleteById(id);
        } catch (Exception e) {
            log.error("Error at [delete]", e);
        }
    }

    @Override
    public void deactiveStore(int storeId) {
        storeRepository.deactiveStore(storeId);
    }
}
