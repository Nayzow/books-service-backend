package com.app.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "comments")
@Data
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String content;
    private String date;

    @ManyToOne
    @JoinColumn(name="id_book")
    private Book book;

    @ManyToOne
    @JoinColumn(name="id_user")
    private User user;
}
