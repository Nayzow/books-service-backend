package com.app.utils.mappings.users;

import com.app.controllers.dtos.users.UserDetailsDTO;
import com.app.models.User;

public class UserDetailsMapping {
    public static UserDetailsDTO mapToDTO(User user) {
        return new UserDetailsDTO(
                user.getId(),
                user.getEmail(),
                user.getUsername(),
                user.getPassword(),
                user.getImage(),
                user.getRole()
        );
    }
}
