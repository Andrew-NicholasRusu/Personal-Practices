package com.example.mediastack.books.domain;

import com.example.mediastack.books.common_media.MediaItem;
import jakarta.persistence.Entity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Entity(name = "Book")

public class Book extends MediaItem {
    private String isbn;
    private String author;
    private Integer totalNumberOfPages;
    private Integer publicationYear;
}
