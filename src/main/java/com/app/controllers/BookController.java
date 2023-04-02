package com.app.controllers;

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
    public List<BookMinimal> getAll() {
        return bookMinimalService.findAll();
    }

    @GetMapping("/{id}")
    public BookDetails getById(@PathVariable Long id) {
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
}
