package com.app.controllers;

import com.app.controllers.dtos.books.BookDTO;
import com.app.controllers.dtos.series.SerieDTO;
import com.app.controllers.dtos.series.SerieDetailsDTO;
import com.app.models.Serie;
import com.app.services.BookService;
import com.app.services.SerieService;
import com.app.utils.mappings.books.BookMapping;
import com.app.utils.mappings.series.SerieDetailsMapping;
import com.app.utils.mappings.series.SerieMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/series")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class SerieController {
    private final SerieService serieService;
    private final BookService bookService;

    @GetMapping
    public List<SerieDTO> findAll(@RequestParam(required = false) String name) {
        return serieService.findAll(name)
                .stream()
                .map(SerieMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public SerieDetailsDTO findById(@PathVariable Long id) {
        return serieService.findById(id)
                .map(SerieDetailsMapping::mapToDTO)
                .orElse(null);
    }

    @PostMapping()
    public void createSerie(@RequestBody Serie serie) {
        serieService.createSerie(serie);
    }

    @DeleteMapping("/{id}")
    public void deleteUser(@PathVariable Long id) {
        serieService.deleteById(id);
    }

    @GetMapping("/{id}/books")
    public List<BookDTO> findAllBySerieId(@PathVariable Long id) {
        return bookService.findAllBySerieId(id)
                .stream()
                .map(BookMapping::mapToDTO)
                .toList();
    }
}
