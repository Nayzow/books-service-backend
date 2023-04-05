package com.app.utils.mappings.users;

import com.app.controllers.dtos.users.UserDTO;
import com.app.models.User;

public abstract class UserMapping {
    public static UserDTO mapToDTO(User user) {
        return new UserDTO(
                user.getId(),
                user.getUsername(),
                user.getImage()
        );
    }
}
