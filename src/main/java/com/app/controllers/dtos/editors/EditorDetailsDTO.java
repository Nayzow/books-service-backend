package com.app.controllers.dtos.editors;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EditorDetailsDTO {
    private Long id;
    private String name;
    private String description;
    private String image;
}
