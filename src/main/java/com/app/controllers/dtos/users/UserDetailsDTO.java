package com.app.controllers.dtos.users;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserDetailsDTO {
    private Long id;
    private String email;
    private String username;
    private String password;
    private String image;
    private String role;
}
