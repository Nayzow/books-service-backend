package com.app.repositories;

import com.app.models.BookStatement;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface BookStatementRepository extends JpaRepository<BookStatement, Long> {

    List<BookStatement> findAllByBookId(Long id);
}
