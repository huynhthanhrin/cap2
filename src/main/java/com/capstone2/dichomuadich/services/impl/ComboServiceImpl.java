package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.repository.ComboRepository;
import com.capstone2.dichomuadich.services.ComboService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ComboServiceImpl implements ComboService{

    @Autowired
    ComboRepository comboRepository;

    @Override
    public List<Combo> getAll(Sort sort) {
        return comboRepository.findAll(sort);
    }

    @Override
    public Combo save(Combo combo) {
        return comboRepository.save(combo);
    }

    @Override
    public List<Combo> getListComboByStore(Store store) {
        return comboRepository.findComboByStore(store);
    }

    @Override
    public void delete(Integer id) {
        comboRepository.deleteById(id);
    }

    @Override
    public Combo getComboById(Integer id) {
        return comboRepository.findComboByComboId(id);
    }

    @Override
    public Combo getComboByStoreAndName(String name, Store store) {
        return comboRepository.findComboByComboNameAndStore(name,store);
    }
}
