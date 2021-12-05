package com.capstone2.dichomuadich.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "order_items")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class OrderItems {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer orderItemsId;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "orderId")
    private Order order;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "itemsId")
    private Items items;

    private int itemQuantity;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "comboId")
    private Combo combo;

    private int comboQuantity;

}
