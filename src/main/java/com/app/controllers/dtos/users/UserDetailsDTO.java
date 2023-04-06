package com.app.controllers.dtos.users;

import com.app.models.Library;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class UserDetailsDTO {
    private Long id;
    private String username;
    private String email;
    private String password;
    private String image;
    private String role;
    private Library library;
}
