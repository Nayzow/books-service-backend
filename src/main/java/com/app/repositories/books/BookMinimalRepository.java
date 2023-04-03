package com.app.repositories.books;

import com.app.models.books.BookMinimal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookMinimalRepository extends JpaRepository<BookMinimal, Long> {
    List<BookMinimal> findByTitleContaining(String title);
}
