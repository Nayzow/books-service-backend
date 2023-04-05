package com.app.repositories;

import com.app.models.Serie;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SerieRepository extends JpaRepository<Serie, Long> {
    List<Serie> findByNameContaining(String name);

    List<Serie> findAllByEditorId(Long id);
}
