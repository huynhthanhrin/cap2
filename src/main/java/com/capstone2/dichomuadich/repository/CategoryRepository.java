package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface CategoryRepository extends JpaRepository<Category, Integer> {
    Category findCategoryByCatNameAndStore(String name, Store store);

    List<Category> findCategoryByStore(Store store);

    Category findCategoriesByCatId(int id);
}
