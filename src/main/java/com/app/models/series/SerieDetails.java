package com.app.models.series;

import com.app.models.books.Book;
import com.app.models.books.BookMinimal;
import com.app.models.editors.Editor;
import jakarta.persistence.*;
import lombok.Data;

import java.util.List;

@Entity
@Table(name = "series")
@Data
public class SerieDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    private String description;
    private String image;

    @ManyToOne
    @JoinColumn(name="id_editor")
    private Editor editor;

    @OneToMany(mappedBy = "serie")
    private List<Book> books;
}
