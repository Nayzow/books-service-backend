package com.app.utils.mappings.editors;

import com.app.controllers.dtos.editors.EditorDTO;
import com.app.models.Editor;

public abstract class EditorMapping {
    public static EditorDTO mapToDTO(Editor editor) {
        return new EditorDTO(
                editor.getId(),
                editor.getName(),
                editor.getImage()
        );
    }
}
