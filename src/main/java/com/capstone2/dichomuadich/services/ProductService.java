package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface ProductService {

    List<Items> getListItems(Store store);

    Items checkItemsExist(String itemName,Store store);

    Items save(Items items);

    void delete(Integer id);

    Items findItemById(Integer id);

    List<Items> getItemsByStoreAndCategory(Store store, Category category);


    List<Items> getAll(Sort sort);

    int updateQuantity(int count, int itemId);

}
