package com.app.controllers;

import com.app.controllers.dtos.bookStatement.BookStatementDTO;
import com.app.controllers.dtos.books.BookDTO;
import com.app.controllers.dtos.books.BookDetailsDTO;
import com.app.controllers.dtos.comments.CommentDTO;
import com.app.models.Book;
import com.app.services.BookService;
import com.app.services.BookStatementService;
import com.app.services.CommentService;
import com.app.utils.mappings.bookStatement.BookStatementMapping;
import com.app.utils.mappings.books.BookDetailsMapping;
import com.app.utils.mappings.books.BookMapping;
import com.app.utils.mappings.comments.CommentMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/books")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class BookController {
    private final BookService bookService;
    private final CommentService commentService;
    private final BookStatementService bookStatementService;

    @GetMapping
    public List<BookDTO> findAll(@RequestParam(required = false) String title) {
        return bookService.findAll(title)
                .stream()
                .map(BookMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public BookDetailsDTO findById(@PathVariable Long id) {
        return bookService.findById(id)
                .map(BookDetailsMapping::mapToDTO)
                .orElse(null);
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
    public List<CommentDTO> findAllCommentsByBookId(@PathVariable Long id) {
        return commentService.findAllByBookId(id)
                .stream()
                .map(CommentMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}/statements")
    public List<BookStatementDTO> findAllBookStatementByBookId(@PathVariable Long id) {
        return bookStatementService.findAllByBookId(id)
                .stream()
                .map(BookStatementMapping::mapToDTO)
                .toList();
    }
}
