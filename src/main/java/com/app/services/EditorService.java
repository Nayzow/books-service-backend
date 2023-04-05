package com.app.services;

import com.app.models.Editor;
import com.app.repositories.EditorRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EditorService {
    private final EditorRepository editorRepository;

    public List<Editor> findAll(String name) {
        if(StringUtils.isNotBlank(name)) {
            return this.editorRepository.findByNameContaining(name);
        }
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
