package com.app.controllers.dtos.editors;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class EditorDTO {
    private Long id;
    private String name;
    private String image;
}
