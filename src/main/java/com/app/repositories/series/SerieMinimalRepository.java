package com.app.repositories.series;

import com.app.models.series.SerieMinimal;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SerieMinimalRepository extends JpaRepository<SerieMinimal, Long> {
    List<SerieMinimal> findByNameContaining(String name);
}
