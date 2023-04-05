package com.app.controllers;

import com.app.controllers.dtos.editors.EditorDTO;
import com.app.controllers.dtos.editors.EditorDetailsDTO;
import com.app.controllers.dtos.series.SerieDTO;
import com.app.models.Editor;
import com.app.services.EditorService;
import com.app.services.SerieService;
import com.app.utils.mappings.editors.EditorDetailsMapping;
import com.app.utils.mappings.editors.EditorMapping;
import com.app.utils.mappings.series.SerieMapping;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@RestController
@RequestMapping("/api/editors")
@CrossOrigin(origins = "http://localhost:4200")
@RequiredArgsConstructor
public class EditorController {
    private final EditorService editorService;
    private final SerieService serieService;

    @GetMapping
    public List<EditorDTO> findAll(@RequestParam(required = false) String name) {
        return editorService.findAll(name)
                .stream()
                .map(EditorMapping::mapToDTO)
                .toList();
    }

    @GetMapping("/{id}")
    public EditorDetailsDTO findById(@PathVariable Long id) {
        return editorService.findById(id)
                .map(EditorDetailsMapping::mapToDTO)
                .orElse(null);
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
    public List<SerieDTO> findAllSeriesByIdEditor(@PathVariable Long id) {
        return serieService.findAllByEditorId(id)
                .stream()
                .map(SerieMapping::mapToDTO)
                .toList();
    }
}
