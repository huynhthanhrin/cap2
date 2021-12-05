package com.capstone2.dichomuadich.models;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;
import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class RegisterRequest implements Serializable {
    private static final long serialVersionUID = 5926468583005150707L;

    private String firstName;
    private String lastName;
    private String username;
    private String password;
    private String identityCardNumber;
    private String phoneNumber;
    private Date dayOfBirth;
    private String gender;
    private String address;
    private int wardId;
}
