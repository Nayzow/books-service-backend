package com.app.services.books;

import com.app.models.books.BookDetails;
import com.app.repositories.books.BookDetailsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookDetailsService {
    private final BookDetailsRepository bookDetailsRepository;

    public Optional<BookDetails> findById(Long id) {
        return bookDetailsRepository.findById(id);
    }
}
