package com.app.services;

import com.app.models.Serie;
import com.app.repositories.SerieRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class SerieService {
    private final SerieRepository serieRepository;

    public List<Serie> findAll(String name) {
        if(StringUtils.isNotBlank(name)) {
            return this.serieRepository.findByNameContaining(name);
        }
        return serieRepository.findAll();
    }

    public void createSerie(Serie serie) {
        serieRepository.save(serie);
    }

    public void deleteById(Long id) {
        serieRepository.deleteById(id);
    }

    public Optional<Serie> findById(Long id) {
        return serieRepository.findById(id);
    }

    public List<Serie> findAllByEditorId(Long id) {
        return serieRepository.findAllByEditorId(id);
    }
}
