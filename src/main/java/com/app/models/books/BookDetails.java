package com.app.models.books;

import com.app.models.Comment;
import com.app.models.series.SerieDetails;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "books")
@Data
public class BookDetails {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private int tome;
    private String title;
    private String author;
    private String illustrator;
    private String date;
    private String image;
    private String description;

    @ManyToOne
    @JoinColumn(name="id_serie")
    private SerieDetails serie;

    @OneToMany(mappedBy = "book")
    private List<Comment> comments;
}
