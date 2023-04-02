package com.app.models.series;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "series")
@Data
public class SerieMinimal {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String image;
}
