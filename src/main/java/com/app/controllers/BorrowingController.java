package com.app.controllers;

import com.app.controllers.dtos.borrowings.BorrowingDTO;
import com.app.models.Borrowing;
import com.app.services.BorrowingService;
import com.app.utils.mappings.borrowings.BorrowingMapping;
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
    public List<BorrowingDTO> findAll() {
        return borrowingService.findAll()
                .stream()
                .map(BorrowingMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public BorrowingDTO findById(@PathVariable Long id) {
        return borrowingService.findById(id)
                .map(BorrowingMapping::mapToDTO)
                .orElse(null);
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
