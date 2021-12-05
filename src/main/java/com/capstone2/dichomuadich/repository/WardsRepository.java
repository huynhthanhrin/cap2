package com.capstone2.dichomuadich.repository;

import com.capstone2.dichomuadich.domain.Store;
import com.capstone2.dichomuadich.domain.Wards;
import org.springframework.data.jpa.repository.JpaRepository;

public interface WardsRepository extends JpaRepository<Wards, Integer> {

    Wards findWardsByWardsId(int id);
}
