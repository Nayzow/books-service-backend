package com.app.utils.mappings.borrowings;

import com.app.controllers.dtos.borrowings.BorrowingDTO;
import com.app.models.Borrowing;
import com.app.utils.mappings.bookStatement.BookStatementMapping;

public abstract class BorrowingMapping {
    public static BorrowingDTO mapToDTO(Borrowing borrowing) {
        return new BorrowingDTO(
                borrowing.getId(),
                borrowing.getDuration(),
                borrowing.getLibrary(),
                BookStatementMapping.mapToDTO(borrowing.getBookStatement())
        );
    }
}
