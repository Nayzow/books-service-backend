package com.app.controllers.dtos.bookStatement;

import com.app.controllers.dtos.books.BookDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BookStatementDTO {
    private Long id;
    private String statement;
    private BookDTO book;
}
