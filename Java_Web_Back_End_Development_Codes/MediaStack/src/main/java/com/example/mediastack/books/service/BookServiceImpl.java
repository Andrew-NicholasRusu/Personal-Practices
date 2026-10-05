package com.example.mediastack.books.service;

import com.example.mediastack.books.domain.Book;
import com.example.mediastack.books.integration.BookApiResponse;
import com.example.mediastack.books.repository.BookRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.core.ParameterizedTypeReference;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestClient;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public final class BookServiceImpl implements IBookService {
    private final BookRepository bookRepository;
    private final RestClient restClient;
    private final String baseApiUri = "https://openlibrary.org/api/books";

    @Override
    public Book create(Object bookData) {
        return null;
    }

    @Override
    public Book createBook(Object bookData) {
        var isbn = bookData.books().keySet().iterator().next();
        var dto = bookData.books().get(isbn);
        var book = new Book();
        book.setTitle(dto.title());
        book.setMediaType(MediaType.BOOK);
        book.setIsbn(isbn);
        book.setAuthor(dto.authors().getFirst().name());
        book.setTotalNumberOfPages(dto.numberOfPages());
        book.setPublicationYear(dto.publicationDate());
        book.setBookCover(dto.cover().medium());
        return null;
    }

    @Override
    public Book getBookById(Long id) {
        return bookRepository.findById(id).orElseThrow(() ->
                new IllegalArgumentException("Book not found with id: " + id));
    }

    @Override
    public Book getBookByIsbn(String isbn) {
        var books = restClient.get()
            .uri("{baseApiUri}?bibkeys={isbn}&format=json*jscmd=data", baseApiUri, isbn)
            .retrieve()
            .body(new ParameterizedTypeReference<Map<String, BookApiResponse.Book>>() {});
        return createBook(new BookApiResponse(books));
    }

        return bookRepository.findByIsbnIgnoreCase(isbn).orElseThrow(() ->
                new IllegalArgumentException("Book not found with ISBN: " + isbn));
    }

    @Override
    public List<Book> getAllBooksByAuthor(String author) {
        return bookRepository.findByAuthorIgnoreCase(author);
    }

    @Override
    public Book updateBook(String isbn, Object updatedBookData) {
        return null;
    }

    @Override
    public void deleteBookById(Long id) {
        bookRepository.deleteById(id);
    }
}
