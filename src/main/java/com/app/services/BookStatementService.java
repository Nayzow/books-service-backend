package com.app.services;

import com.app.models.BookStatement;
import com.app.repositories.BookStatementRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookStatementService {
    private final BookStatementRepository bookStatementRepository;

    public List<BookStatement> findAll() {
        return bookStatementRepository.findAll();
    }
    public void createBookStatement(BookStatement bookStatement) {
        bookStatementRepository.save(bookStatement);
    }

    public void deleteById(Long id) {
        bookStatementRepository.deleteById(id);
    }

    public Optional<BookStatement> findById(Long id) {
        return bookStatementRepository.findById(id);
    }

    public List<BookStatement> findAllByBookId(Long id) {
        return bookStatementRepository.findAllByBookId(id);
    }
}
