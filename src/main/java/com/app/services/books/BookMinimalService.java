package com.app.services.books;

import com.app.models.books.Book;
import com.app.models.books.BookMinimal;
import com.app.repositories.books.BookMinimalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookMinimalService {
    private final BookMinimalRepository bookMinimalRepository;

    public List<BookMinimal> findAll() {
        return bookMinimalRepository.findAll();
    }
}
