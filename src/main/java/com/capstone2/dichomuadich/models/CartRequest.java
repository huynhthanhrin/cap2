package com.capstone2.dichomuadich.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartRequest {
    private int count;
    private String image;
    private String name;
    private Double price;
    private String productcode;
    private String total;
    private String isCombo;
    private int storeId;
}
