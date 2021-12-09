package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface ProductService {

    Page<Items> getListItems(Store store, Pageable pageable);

    List<Items> getListItemsByStore(Store store);

    Items checkItemsExist(String itemName,Store store);

    Items save(Items items);

    void delete(Integer id);

    Items findItemById(Integer id);

    Page<Items> getItemsByStoreAndCategory(Store store, Category category,Pageable pageable);

    List<Items> getItemsByStoreAndCategory(Store store, Category category);

    List<Items> getAll(Sort sort);

    List<Items> getAll();

    int updateQuantity(int count, int itemId);

}
