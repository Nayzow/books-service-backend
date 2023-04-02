package com.app.models;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "libraries")
@Data
public class Library {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @OneToOne
    @JoinColumn(name="id_user")
    private User user;
}
