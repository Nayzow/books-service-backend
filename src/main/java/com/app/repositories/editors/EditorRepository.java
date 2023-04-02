package com.app.repositories.editors;

import com.app.models.editors.Editor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EditorRepository  extends JpaRepository<Editor, Long> {

}
