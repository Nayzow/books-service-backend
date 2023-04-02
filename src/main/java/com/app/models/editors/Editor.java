package com.app.models.editors;

import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "editors")
@Data
public class Editor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String image;
}
