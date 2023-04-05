package com.app.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "books_statement")
@Data
public class BookStatement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String statement;

    @OneToOne
    @JoinColumn(name="id_book")
    private Book book;
}
