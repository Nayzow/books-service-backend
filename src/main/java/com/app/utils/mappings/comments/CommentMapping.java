package com.app.utils.mappings.comments;

import com.app.controllers.dtos.comments.CommentDTO;
import com.app.models.Comment;
import com.app.utils.mappings.users.UserMapping;

public abstract class CommentMapping {
    public static CommentDTO mapToDTO(Comment comment) {
        return new CommentDTO(
                comment.getId(),
                comment.getContent(),
                comment.getDate(),
                UserMapping.mapToDTO(comment.getUser())
        );
    }
}
