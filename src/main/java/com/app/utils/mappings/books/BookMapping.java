package com.app.utils.mappings.books;

import com.app.controllers.dtos.books.BookDTO;
import com.app.models.Book;

public abstract class BookMapping {
    public static BookDTO mapToDTO(Book book) {
        return new BookDTO(
                book.getId(),
                book.getTitle(),
                book.getImage()
        );
    }
}
