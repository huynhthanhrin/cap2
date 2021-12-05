package com.capstone2.dichomuadich.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ConfirmOrderRequest {
    private String recipientName;
    private String recipientPhone;
    private String recipientAddress;
    private String sameAddressDelivery;
    private CartRequest[] cartRequest;
}
