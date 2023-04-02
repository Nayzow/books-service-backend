package com.app.repositories.books;

import com.app.models.books.BookDetails;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookDetailsRepository extends JpaRepository<BookDetails, Long> {

}
