package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Items;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;

import javax.transaction.Transactional;
import java.util.List;

@Repository
public interface ItemsRepository extends PagingAndSortingRepository<Items, Integer> {

    List<Items> findAll(Sort sort);

    List<Items> findAll();

    Page<Items> findItemsByStore(Store store, Pageable pageable);

    List<Items> findItemsByStore(Store store);

    Items findItemsByItemNameAndStore(String itemName,Store store);

    Items findItemsByItemsId(Integer id);

    Page<Items> findItemsByStoreAndCategory(Store store, Category category,Pageable pageable);

    List<Items> findItemsByStoreAndCategory(Store store, Category category);

    @Modifying
    @Query(value = "update item set quantity = quantity - ? where itemsId = ?", nativeQuery = true)
    @Transactional
    int updateQuantity(int count, int itemId);

    @Query(value = "SELECT a.* FROM item as a , category as b WHERE a.catId = b.catId and a.itemName LIKE %?1% or b.catName LIKE %?1%", nativeQuery = true)
    List<Items> search(String keyword);
}
