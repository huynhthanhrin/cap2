package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.repository.ItemsRepository;
import com.capstone2.dichomuadich.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    ItemsRepository itemsRepository;

    @Override
    public List<Items> getListItems(Store store) {
        return itemsRepository.findItemsByStore(store);
    }

    @Override
    public Items checkItemsExist(String itemName,Store store) {
        return itemsRepository.findItemsByItemNameAndStore(itemName,store);
    }

    @Override
    public Items save(Items items) {
        return itemsRepository.save(items);
    }

    @Override
    public void delete(Integer id) {
        itemsRepository.deleteById(id);
    }

    @Override
    public Items findItemById(Integer id) {
        return itemsRepository.findItemsByItemsId(id);
    }

    @Override
    public List<Items> getItemsByStoreAndCategory(Store store, Category category) {
        return itemsRepository.findItemsByStoreAndCategory(store, category);
    }

    @Override
    public List<Items> getAll(Sort sort) {
        return itemsRepository.findAll(sort);

    }

    @Override
    public int updateQuantity(int count, int itemId) {
        return itemsRepository.updateQuantity(count, itemId);
    }
}
