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
@Table(name = "item")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Items {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer itemsId;

    private String itemName;

    @ManyToOne(
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "catId")
    private Category category;

    private String price;

    private int quantity;   //Số lượng mặt hàng tồn tại

    private String unit;    // Đơn vị tính cho mặt hàng

    private String image;

    private String description;

    @Column(columnDefinition = "int default 0")
    private int view;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "storeId")
    private Store store;   // Nhà cung cấp or cửa hàng cung cấp mặt hàng
}
