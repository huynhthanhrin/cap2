package com.capstone2.dichomuadich.services;

import com.capstone2.dichomuadich.domain.Wards;

import java.util.List;

public interface WardsService {

    List<Wards> findAll();

    Wards findWardByWardsId(int id);
}
