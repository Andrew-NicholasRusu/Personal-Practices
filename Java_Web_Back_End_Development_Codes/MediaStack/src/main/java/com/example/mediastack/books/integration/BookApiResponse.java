package com.example.mediastack.books.integration;

import com.example.mediastack.books.domain.Book;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;
import java.util.Map;

@JsonIgnoreProperties(ignoreUnknown = true)
public record BookApiResponse(Map<String, Book> books) {

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record Book(
            String title,
            List<Author> authors,
            @JsonProperty("number_of_pages")
            Integer numberOfPages,
            @JsonProperty("publish_date")
            String publicationDate,
            Cover cover
    ) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record Author(String name) {}

    @JsonIgnoreProperties(ignoreUnknown = true)
    public record Cover(
        String small,
        String medium,
        String large
    ) {}
}
