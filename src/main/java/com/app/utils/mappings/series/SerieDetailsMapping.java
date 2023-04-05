package com.app.utils.mappings.series;

import com.app.controllers.dtos.series.SerieDetailsDTO;
import com.app.models.Serie;
import com.app.utils.mappings.editors.EditorMapping;

public abstract class SerieDetailsMapping {
    public static SerieDetailsDTO mapToDTO(Serie serie) {
        return new SerieDetailsDTO(
                serie.getId(),
                serie.getName(),
                serie.getDescription(),
                serie.getImage(),
                EditorMapping.mapToDTO(serie.getEditor())
        );
    }
}
