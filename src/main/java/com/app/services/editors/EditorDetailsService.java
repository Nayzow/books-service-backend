package com.app.services.editors;

import com.app.models.books.BookMinimal;
import com.app.models.editors.EditorDetails;
import com.app.models.series.Serie;
import com.app.models.series.SerieDetails;
import com.app.models.series.SerieMinimal;
import com.app.repositories.editors.EditorDetailsRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class EditorDetailsService {
    private final EditorDetailsRepository editorDetailsRepository;

    public Optional<EditorDetails> findById(Long id) {
        return editorDetailsRepository.findById(id);
    }

    public List<Serie> findAllSeriesByIdEditor(@PathVariable Long id) {
        EditorDetails editorDetails = editorDetailsRepository.findById(id).orElseThrow(() -> new RuntimeException("Série introuvable"));
        return editorDetails.getSeries();
    }
}
