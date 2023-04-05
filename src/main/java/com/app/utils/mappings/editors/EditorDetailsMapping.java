package com.app.utils.mappings.editors;

import com.app.controllers.dtos.editors.EditorDetailsDTO;
import com.app.models.Editor;

public abstract class EditorDetailsMapping {
    public static EditorDetailsDTO mapToDTO(Editor editor) {
        return new EditorDetailsDTO(
                editor.getId(),
                editor.getName(),
                editor.getDescription(),
                editor.getImage()
        );
    }
}
