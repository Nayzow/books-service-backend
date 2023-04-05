package com.app.services;

import com.app.models.Book;
import com.app.repositories.BookRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookService {
    private final BookRepository bookRepository;

    public List<Book> findAll(String title) {
        if(StringUtils.isNotBlank(title)) {
            return this.bookRepository.findByTitleContaining(title);
        }
        return bookRepository.findAll();
    }

    public void createBook(Book book) {
        bookRepository.save(book);
    }

    public void deleteById(Long id) {
        bookRepository.deleteById(id);
    }

    public Optional<Book> findById(Long id) {
        return bookRepository.findById(id);
    }

    public List<Book> findAllBySerieId(Long id) {
        return bookRepository.findAllBySerieId(id);
    }
}
