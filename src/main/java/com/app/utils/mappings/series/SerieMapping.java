package com.app.utils.mappings.series;

import com.app.controllers.dtos.series.SerieDTO;
import com.app.models.Serie;

public abstract class SerieMapping {
    public static SerieDTO mapToDTO(Serie serie) {
        return new SerieDTO(
                serie.getId(),
                serie.getName(),
                serie.getImage()
        );
    }
}
