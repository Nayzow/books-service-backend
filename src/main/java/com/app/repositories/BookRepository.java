package com.app.repositories;

import com.app.models.Book;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookRepository extends JpaRepository<Book, Long> {
    List<Book> findByTitleContaining(String name);

    List<Book> findAllBySerieId(Long id);
}
