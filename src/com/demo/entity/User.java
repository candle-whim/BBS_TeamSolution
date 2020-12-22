package com.demo.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private String id;
    private String password;
    private String name;
    private String image;
    private int score;
    private string email;
    private int class;
    private string signature;
    private int sex;
    private string telephone;
    private String briefIntro;
    private Date birthday;
}
