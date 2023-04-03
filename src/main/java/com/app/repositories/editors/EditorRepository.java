package com.app.repositories.editors;

import com.app.models.editors.Editor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EditorRepository  extends JpaRepository<Editor, Long> {
    List<Editor> findByNameContaining(String name);
}
