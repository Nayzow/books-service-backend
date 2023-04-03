package com.app.services.books;

import com.app.models.Comment;
import com.app.models.books.Book;
import com.app.models.books.BookDetails;
import com.app.repositories.CommentRepository;
import com.app.repositories.books.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class BookService {
    private final BookRepository bookRepository;

    public List<Book> findAll() {
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
}
