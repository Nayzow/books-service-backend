package com.app.utils.mappings.books;

import com.app.controllers.dtos.books.BookDetailsDTO;
import com.app.models.Book;
import com.app.utils.mappings.series.SerieDetailsMapping;

public abstract class BookDetailsMapping {
    public static BookDetailsDTO mapToDTO(Book book) {
        return new BookDetailsDTO(
                book.getId(),
                book.getTome(),
                book.getTitle(),
                book.getDescription(),
                book.getAuthor(),
                book.getIllustrator(),
                book.getDate(),
                book.getImage(),
                SerieDetailsMapping.mapToDTO(book.getSerie())
        );
    }
}
