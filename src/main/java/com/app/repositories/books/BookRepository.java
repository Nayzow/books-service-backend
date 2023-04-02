package com.app.repositories.books;

import com.app.models.books.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findBySerieId(Long idSerie);
}
