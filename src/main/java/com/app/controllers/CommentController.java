package com.app.controllers;

import com.app.models.Comment;
import com.app.services.CommentService;
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
    public List<Comment> getAll() {
        return commentService.findAll();
    }

    @GetMapping("/{id}")
    public Comment getById(@PathVariable Long id) {
        return commentService.findById(id).orElse(null);
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
