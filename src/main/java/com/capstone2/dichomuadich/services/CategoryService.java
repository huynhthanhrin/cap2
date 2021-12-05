package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;

import java.util.List;

public interface CategoryService {

    List<Category> getAll();

    Category save(Category category);

    Category checkExistCategory(String name, Store store);

    void delete(Integer id);

    List<Category> getListCategoryByStore(Store store);

    Category getCategoryById(int id);
}
