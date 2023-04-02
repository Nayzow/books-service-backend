package com.app.services.editors;

import com.app.models.editors.Editor;
import com.app.repositories.editors.EditorRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EditorService {
    private final EditorRepository editorRepository;

    public List<Editor> findAll() {
        return editorRepository.findAll();
    }

    public void createEditor(Editor editor) {
        editorRepository.save(editor);
    }

    public void deleteById(Long id) {
        editorRepository.deleteById(id);
    }

    public Optional<Editor> findById(Long id) {
        return editorRepository.findById(id);
    }
}
