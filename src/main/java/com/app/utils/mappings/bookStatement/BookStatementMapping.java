package com.app.utils.mappings.bookStatement;

import com.app.controllers.dtos.bookStatement.BookStatementDTO;
import com.app.models.BookStatement;
import com.app.utils.mappings.books.BookMapping;


public abstract class BookStatementMapping {
    public static BookStatementDTO mapToDTO(BookStatement bookStatement) {
        return new BookStatementDTO(
                bookStatement.getId(),
                bookStatement.getStatement(),
                BookMapping.mapToDTO(bookStatement.getBook())
        );
    }
}