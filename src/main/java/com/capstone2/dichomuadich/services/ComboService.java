package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

import java.util.List;

public interface ComboService {
    List<Combo> getAll(Sort sort);

    Combo save(Combo combo);

    List<Combo> getListComboByStore(Store store);

    Page<Combo> getListComboByStore(Store store, Pageable pageable);

    void delete(Integer id);

    Combo getComboById(Integer id);

    Combo getComboByStoreAndName(String name,Store store);
}
