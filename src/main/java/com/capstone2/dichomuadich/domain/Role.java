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
@Table(name = "role")
@JsonIgnoreProperties({"hibernateLazyInitializer", "handler"})
public class Role {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer roleId;

    private String roleCode;

    private String roleName;

    private String description;


    /**
     * TODO: Constructs ...
     *
     * @param id
     */
    public Role(int id) {
        this.roleId = id;
    }

    /**
     * TODO: Constructs ...
     *
     * @param id
     * @param roleCode
     * @param roleName
     */
    public Role(int id, String roleCode, String roleName) {
        this.roleId = id;
        this.roleCode = roleCode;
        this.roleName = roleName;
    }

    @Override
    public String toString() {
        return "Role{" + "id=" + roleId + ", roleCode='" + roleCode + '\'' + ", roleName='" + roleName + '\'' + '}';
    }
}
