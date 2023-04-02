package com.app.models.editors;

import com.app.models.series.Serie;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "editors")
@Data
public class EditorDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String image;

    @OneToMany(mappedBy = "editor")
    private List<Serie> series;
}
