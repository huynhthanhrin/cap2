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
@Table(name = "combo_items")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class ComboItems {
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer comboItemId;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "comboId")
    private Combo combo;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "itemId")
    private Items items;
}
