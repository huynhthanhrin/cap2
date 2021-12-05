package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Category;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.repository.CategoryRepository;
import com.capstone2.dichomuadich.services.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryServiceImpl implements CategoryService {

    @Autowired
    CategoryRepository categoryRepository;

    @Override
    public List<Category> getAll() {
        return categoryRepository.findAll();
    }

    @Override
    public Category save(Category category) {
        return categoryRepository.save(category);
    }

    @Override
    public Category checkExistCategory(String name, Store store) {
        return categoryRepository.findCategoryByCatNameAndStore(name, store);
    }

    @Override
    public void delete(Integer id) {
        categoryRepository.deleteById(id);
    }

    @Override
    public List<Category> getListCategoryByStore(Store store) {
        return categoryRepository.findCategoryByStore(store);
    }

    @Override
    public Category getCategoryById(int id) {
        return categoryRepository.findCategoriesByCatId(id);
    }


}
