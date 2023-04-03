package com.app.controllers;

import com.app.models.Comment;
import com.app.models.books.Book;
import com.app.models.books.BookDetails;
import com.app.models.books.BookMinimal;
import com.app.services.books.BookDetailsService;
import com.app.services.books.BookMinimalService;
import com.app.services.books.BookService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class BookController {
    private final BookService bookService;
    private final BookDetailsService bookDetailsService;
    private final BookMinimalService bookMinimalService;

    @GetMapping
    public List<BookMinimal> findAll(@RequestParam(required = false) String title) {
        return bookMinimalService.findAll(title);
    }

    @GetMapping("/{id}")
    public BookDetails findById(@PathVariable Long id) {
        return bookDetailsService.findById(id).orElse(null);
    }

    @PostMapping()
    public void createBook(@RequestBody Book book) {
        bookService.createBook(book);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        bookService.deleteById(id);
    }

    @GetMapping("/{id}/comments")
    public List<Comment> findAllCommentsByBookId(@PathVariable Long id) {
        return bookDetailsService.findAllCommentsByBookId(id);
    }
}
