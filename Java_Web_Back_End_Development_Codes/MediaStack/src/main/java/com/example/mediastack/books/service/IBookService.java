package com.example.mediastack.books.service;

import com.example.mediastack.books.domain.Book;

import java.util.List;

public sealed interface IBookService permits BookServiceImpl {
    /// CRUD

    // Create
    Book create(Object bookData);

    Book createBook(Object bookData);

    // Read
    Book getBookById(Long id);
    Book getBookByIsbn(String isbn);
    List<Book> getAllBooksByAuthor(String author);

    // Update
    Book updateBook(String isbn, Object updatedBookData);

    // Delete
    void deleteBookById(Long id);
}
