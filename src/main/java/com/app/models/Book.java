package com.app.models;

import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "books")
@Data
public class Book {
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
    private Serie serie;
}
