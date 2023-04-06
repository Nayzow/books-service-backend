package com.app.controllers;

import com.app.controllers.dtos.comments.CommentDTO;
import com.app.models.Comment;
import com.app.services.CommentService;
import com.app.utils.mappings.comments.CommentMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/comments")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class CommentController {
    private final CommentService commentService;

    @GetMapping
    public List<CommentDTO> findAll() {
        return commentService.findAll()
                .stream()
                .map(CommentMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public CommentDTO findById(@PathVariable Long id) {
        return commentService.findById(id)
                .map(CommentMapping::mapToDTO)
                .orElse(null);
    }

    @PostMapping()
    public void createBook(@RequestBody Comment comment) {
        commentService.createComment(comment);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        commentService.deleteById(id);
    }
}
