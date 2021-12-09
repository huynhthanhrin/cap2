package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import java.util.List;

public interface ComboRepository extends PagingAndSortingRepository<Combo, Integer> {
    List<Combo> findComboByStore(Store store);

    List<Combo> findAll(Sort sort);

    Page<Combo> findComboByStore(Store store, Pageable pageable);

    Combo findComboByComboNameAndStore(String comboName, Store store);

    Combo findComboByComboId(Integer id);
}
