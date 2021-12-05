package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Combo;
import com.capstone2.dichomuadich.domain.Store;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ComboRepository extends JpaRepository<Combo, Integer> {
    List<Combo> findComboByStore(Store store);

    Combo findComboByComboNameAndStore(String comboName, Store store);

    Combo findComboByComboId(Integer id);
}
