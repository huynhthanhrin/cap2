package com.capstone2.dichomuadich.services.impl;

import com.capstone2.dichomuadich.domain.Wards;
import com.capstone2.dichomuadich.repository.WardsRepository;
import com.capstone2.dichomuadich.services.WardsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class WardsServiceImpl implements WardsService {

    @Autowired
    WardsRepository wardsRepository;

    @Override
    public List<Wards> findAll() {
        return wardsRepository.findAll();
    }

    @Override
    public Wards findWardByWardsId(int id) {
        return wardsRepository.findWardsByWardsId(id);
    }
}
