package com.app.controllers.dtos.comments;

import com.app.controllers.dtos.users.UserDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CommentDTO {
    private Long id;
    private String content;
    private String date;
    private UserDTO user;
}
