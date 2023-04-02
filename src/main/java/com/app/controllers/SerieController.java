package com.app.controllers;

import com.app.models.books.Book;
import com.app.models.series.Serie;
import com.app.models.series.SerieDetails;
import com.app.models.series.SerieMinimal;
import com.app.services.series.SerieDetailsService;
import com.app.services.series.SerieMinimalService;
import com.app.services.series.SerieService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/series")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class SerieController {
    private final SerieService serieService;
    private final SerieDetailsService serieDetailsService;
    private final SerieMinimalService serieMinimalService;

    @GetMapping
    public List<SerieMinimal> getAll() {
        return serieMinimalService.findAll();
    }

    @GetMapping("/{id}")
    public SerieDetails getById(@PathVariable Long id) {
        return serieDetailsService.findById(id).orElse(null);
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
    public List<Book> findAllBooksByIdSerie(@PathVariable Long id) {
        return serieDetailsService.findAllBooksByIdSerie(id);
    }
}
