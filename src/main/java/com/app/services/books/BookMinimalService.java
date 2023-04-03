package com.app.services.books;

import com.app.models.books.Book;
import com.app.models.books.BookMinimal;
import com.app.repositories.books.BookMinimalRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BookMinimalService {
    private final BookMinimalRepository bookMinimalRepository;

    public List<BookMinimal> findAll(String title) {
        if(StringUtils.isNotBlank(title)) {
            return this.bookMinimalRepository.findByTitleContaining(title);
        }
        return bookMinimalRepository.findAll();
    }
}
