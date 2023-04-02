package com.app.controllers;

import com.app.models.Library;
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

    @GetMapping
    public List<Library> getAll() {
        return libraryService.findAll();
    }

    @GetMapping("/{id}")
    public Library getById(@PathVariable Long id) {
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
}
