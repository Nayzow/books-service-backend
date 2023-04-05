package com.app.repositories;

import com.app.models.Editor;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface EditorRepository extends JpaRepository<Editor, Long> {
    List<Editor> findByNameContaining(String name);
}
