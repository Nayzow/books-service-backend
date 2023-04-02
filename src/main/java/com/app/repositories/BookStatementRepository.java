package com.app.repositories;

import com.app.models.BookStatement;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookStatementRepository extends JpaRepository<BookStatement, Long> {

}
