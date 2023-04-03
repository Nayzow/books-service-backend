package com.app.services.series;

import com.app.models.series.SerieMinimal;
import com.app.repositories.series.SerieMinimalRepository;
import io.micrometer.common.util.StringUtils;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class SerieMinimalService {
    private final SerieMinimalRepository serieMinimalRepository;

    public List<SerieMinimal> findAll(String name) {
        if(StringUtils.isNotBlank(name)) {
            return this.serieMinimalRepository.findByNameContaining(name);
        }
        return serieMinimalRepository.findAll();
    }
}
