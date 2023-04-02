package com.app.controllers;

import com.app.models.Borrowing;
import com.app.services.BorrowingService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/borrowings")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class BorrowingController {
    private final BorrowingService borrowingService;

    @GetMapping
    public List<Borrowing> getAll() {
        return borrowingService.findAll();
    }

    @GetMapping("/{id}")
    public Borrowing getById(@PathVariable Long id) {
        return borrowingService.findById(id).orElse(null);
    }

    @PostMapping()
    public void createBook(@RequestBody Borrowing borrowing) {
        borrowingService.createBorrowing(borrowing);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        borrowingService.deleteById(id);
    }
}
