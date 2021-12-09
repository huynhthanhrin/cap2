package com.capstone2.dichomuadich.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.sql.Timestamp;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order_tb")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Order {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "orderId")
    private Integer orderId;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "userId")
    private User user;     // người đặt hàng

    private String recipientName;

    private String recipientAddress;

    private String recipientPhone;

    private Timestamp orderTime;   //Thời gian đặt

    private Double totalPrice;

    private int status;

    private int statusPayment;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "storeId")
    private Store store;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "order_items", joinColumns = @JoinColumn(name = "orderId"), inverseJoinColumns = @JoinColumn(name = "itemsId"))
    private Set<Items> items = new HashSet<>();

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "order_items", joinColumns = @JoinColumn(name = "orderId"), inverseJoinColumns = @JoinColumn(name = "comboId"))
    private Set<Combo> combos = new HashSet<>();



}
