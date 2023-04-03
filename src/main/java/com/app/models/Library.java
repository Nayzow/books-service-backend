package com.app.models;

import com.app.models.users.User;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

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

    @OneToMany(mappedBy = "library")
    private List<Borrowing> borrowings;
}
