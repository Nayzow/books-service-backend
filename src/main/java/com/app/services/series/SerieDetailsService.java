package com.app.services.series;

import com.app.models.books.Book;
import com.app.models.series.SerieDetails;
import com.app.repositories.series.SerieDetailsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SerieDetailsService {
    private final SerieDetailsRepository serieDetailsRepository;

    public Optional<SerieDetails> findById(Long id) {
        return serieDetailsRepository.findById(id);
    }

    public List<Book> findAllBooksByIdSerie(@PathVariable Long id) {
        SerieDetails serieDetails = serieDetailsRepository.findById(id).orElseThrow(() -> new RuntimeException("Série introuvable"));
        return serieDetails.getBooks();
    }
}
