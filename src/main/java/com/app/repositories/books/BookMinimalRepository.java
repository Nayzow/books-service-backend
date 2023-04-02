package com.app.repositories.books;

import com.app.models.books.BookMinimal;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookMinimalRepository extends JpaRepository<BookMinimal, Long> {
}
