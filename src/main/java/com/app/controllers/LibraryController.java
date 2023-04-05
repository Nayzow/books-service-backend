package com.app.controllers;

import com.app.models.Borrowing;
import com.app.models.Library;
import com.app.services.BorrowingService;
import com.app.services.LibraryService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/libraries")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class LibraryController {
    private final LibraryService libraryService;
    private final BorrowingService borrowingService;

    @GetMapping
    public List<Library> findAll() {
        return libraryService.findAll();
    }

    @GetMapping("/{id}")
    public Library findById(@PathVariable Long id) {
        return libraryService.findById(id).orElse(null);
    }

    @PostMapping
    public void createLibrary(@RequestBody Library library) {
        libraryService.createLibrary(library);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        libraryService.deleteById(id);
    }

    @GetMapping("/{id}/borrowings")
    public List<Borrowing> findAllBorrowingsByIdLibrary(@PathVariable Long id) {
        return borrowingService.findAllByIdLibrary(id);
    }
}
