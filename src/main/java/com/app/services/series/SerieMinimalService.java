package com.app.services.series;

import com.app.models.series.SerieMinimal;
import com.app.repositories.series.SerieMinimalRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SerieMinimalService {
    private final SerieMinimalRepository serieMinimalRepository;

    public List<SerieMinimal> findAll() {
        return serieMinimalRepository.findAll();
    }
}
