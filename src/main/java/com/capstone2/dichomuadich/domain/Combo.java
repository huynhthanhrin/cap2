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
@Table(name = "combo")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Combo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer comboId;

    private String comboName;

    private String description;

    private String image;

    private String price;

    @Column(columnDefinition = "int default 0")
    private int view;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "storeId")
    private Store store;
}
