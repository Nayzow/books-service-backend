package com.app.controllers;

import com.app.controllers.dtos.borrowings.BorrowingDTO;
import com.app.models.Library;
import com.app.services.BorrowingService;
import com.app.services.LibraryService;
import com.app.utils.mappings.borrowings.BorrowingMapping;
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
    public List<BorrowingDTO> findAllBorrowingsByIdLibrary(@PathVariable Long id) {
        return borrowingService.findAllByIdLibrary(id)
                .stream()
                .map(BorrowingMapping::mapToDTO)
                .toList();
    }
}
