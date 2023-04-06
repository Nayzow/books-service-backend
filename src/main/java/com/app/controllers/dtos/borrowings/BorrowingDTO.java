package com.app.controllers.dtos.borrowings;

import com.app.controllers.dtos.bookStatement.BookStatementDTO;
import com.app.models.Library;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class BorrowingDTO {
    private Long id;
    private String duration;
    private Library library;
    private BookStatementDTO bookStatement;
}
