package com.app.models.series;

import com.app.models.editors.Editor;
import jakarta.persistence.*;
import lombok.Data;

@Entity
@Table(name = "series")
@Data
public class Serie {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String image;

    @ManyToOne
    @JoinColumn(name="id_editor")
    private Editor editor;
}
