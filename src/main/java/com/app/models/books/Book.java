package com.app.models.books;

import com.app.models.series.Serie;
import com.app.models.series.SerieMinimal;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "books")
@Data
public class Book {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private String image;

    @ManyToOne
    @JoinColumn(name="id_serie")
    private Serie serie;
}
