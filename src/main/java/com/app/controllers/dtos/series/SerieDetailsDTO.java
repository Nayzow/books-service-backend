package com.app.controllers.dtos.series;

import com.app.controllers.dtos.editors.EditorDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SerieDetailsDTO {
    private Long id;
    private String name;
    private String description;
    private String image;
    private EditorDTO editor;
}
