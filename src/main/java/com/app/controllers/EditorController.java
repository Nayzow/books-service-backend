package com.app.controllers;

import com.app.models.editors.Editor;
import com.app.models.editors.EditorDetails;
import com.app.models.series.Serie;
import com.app.services.editors.EditorDetailsService;
import com.app.services.editors.EditorService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/editors")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class EditorController {
    private final EditorService editorService;
    private final EditorDetailsService editorDetailsService;

    @GetMapping
    public List<Editor> getAll() {
        return editorService.findAll();
    }

    @GetMapping("/{id}")
    public EditorDetails getById(@PathVariable Long id) {
        return editorDetailsService.findById(id).orElse(null);
    }

    @PostMapping
    public void createEditor(@RequestBody Editor editor) {
        editorService.createEditor(editor);
    }

    @DeleteMapping("/{id}")
    public void deleteById(@PathVariable Long id) {
        editorService.deleteById(id);
    }

    @GetMapping("/{id}/series")
    public List<Serie> findAllBooksByIdSerie(@PathVariable Long id) {
        return editorDetailsService.findAllSeriesByIdEditor(id);
    }
}
