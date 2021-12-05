package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ItemsRepository extends JpaRepository<Items, Integer> {

    List<Items> findItemsByStore(Store store);

    Items findItemsByItemNameAndStore(String itemName,Store store);

    Items findItemsByItemsId(Integer id);

    List<Items> findItemsByStoreAndCategory(Store store, Category category);

    @Modifying
    @Query(value = "update item set quantity = quantity - ? where itemsId = ?", nativeQuery = true)
    @Transactional
    int updateQuantity(int count, int itemId);
}
