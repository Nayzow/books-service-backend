package com.app.controllers;

import com.app.models.BookStatement;
import com.app.services.BookStatementService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/statements")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class BookStatementController {
    private final BookStatementService bookStatementService;

    @GetMapping
    public List<BookStatement> findAll() {
        return bookStatementService.findAll();
    }

    @GetMapping("/{id}")
    public BookStatement findById(@PathVariable Long id) {
        return bookStatementService.findById(id).orElse(null);
    }

    @PostMapping
    public void createBookStatement(@RequestBody BookStatement bookStatement) {
        bookStatementService.createBookStatement(bookStatement);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        bookStatementService.deleteById(id);
    }
}
