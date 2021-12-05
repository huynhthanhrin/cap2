package com.capstone2.dichomuadich.domain;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name = "user")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userId;

    private String firstName;

    private String lastName;

    @NotNull
    private String username;

    @NotNull
    private String password;

    private Date dateOfBirth;

    private String identityCardNumber;      //Số chứng minh nhân dân

    @NotNull
    private String phoneNumber;

    private String email;

    private String gender;

    private String avatar;

    @NotNull
    private String address;

    private int status;

    private String token;

    private String rememberToken;

    @OneToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "wardsId")
    private Wards wards;

    @ManyToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "storeId")
    private Store store;

    @OneToOne(
            cascade = CascadeType.MERGE,
            fetch = FetchType.EAGER
    )
    @JoinColumn(name = "roleId")
    private Role role;

    public String getFullName()
    {
        return firstName + " " + lastName;
    }
}
