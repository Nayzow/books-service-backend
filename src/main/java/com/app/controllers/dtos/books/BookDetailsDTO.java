package com.app.controllers.dtos.books;

import com.app.controllers.dtos.series.SerieDetailsDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BookDetailsDTO {
    private Long id;
    private int tome;
    private String title;
    private String description;
    private String author;
    private String illustrator;
    private String date;
    private String image;
    private SerieDetailsDTO serie;
}
