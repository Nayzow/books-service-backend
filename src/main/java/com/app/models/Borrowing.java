package com.app.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "borrowings")
@Data
public class Borrowing {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String duration;

    @ManyToOne
    @JoinColumn(name="id_user")
    private User user;

    @OneToOne
    @JoinColumn(name="id_book_statement")
    private BookStatement bookStatement;
}
