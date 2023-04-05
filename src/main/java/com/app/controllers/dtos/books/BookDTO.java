package com.app.controllers.dtos.books;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BookDTO {
    private Long id;
    private String title;
    private String image;
}
