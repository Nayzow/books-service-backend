package com.app.controllers.dtos.series;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class SerieDTO {
    private Long id;
    private String name;
    private String image;
}
