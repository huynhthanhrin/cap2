package com.capstone2.dichomuadich.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

/**
 * Phường (info)
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "Wards")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Wards {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int wardsId;

    private String wardName;
}
