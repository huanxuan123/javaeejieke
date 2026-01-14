package com.library.service.impl;

import com.library.dao.BookMapper;
import com.library.pojo.Book;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class BookServiceImpl implements BookService {

    @Autowired
    private BookMapper bookMapper;

    @Override
    public Book findById(Integer bookId) {
        if (bookId == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        return bookMapper.selectById(bookId);
    }

    @Override
    public Book findByIsbn(String isbn) {
        if (isbn == null || isbn.trim().isEmpty()) {
            throw new IllegalArgumentException("ISBN cannot be empty");
        }
        return bookMapper.selectByIsbn(isbn);
    }

    @Override
    public List<Book> findAll() {
        return bookMapper.selectAll();
    }

    @Override
    public List<Book> findByCondition(String title, String author, String category, Integer status) {
        return bookMapper.selectByCondition(title, author, category, status);
    }

    @Override
    public List<Book> findAvailableBooks() {
        return bookMapper.selectAvailableBooks();
    }

    @Override
    public boolean save(Book book) {
        if (book == null) {
            throw new IllegalArgumentException("Book cannot be null");
        }
        if (book.getTitle() == null || book.getTitle().trim().isEmpty()) {
            throw new IllegalArgumentException("Book title cannot be empty");
        }
        if (book.getAuthor() == null || book.getAuthor().trim().isEmpty()) {
            throw new IllegalArgumentException("Book author cannot be empty");
        }
        if (book.getTotalStock() == null) {
            book.setTotalStock(1);
        }
        if (book.getAvailableStock() == null) {
            book.setAvailableStock(book.getTotalStock());
        }
        if (book.getStatus() == null) {
            book.setStatus(1);
        }
        return bookMapper.insert(book) > 0;
    }

    @Override
    public boolean update(Book book) {
        if (book == null) {
            throw new IllegalArgumentException("Book cannot be null");
        }
        if (book.getBookId() == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        return bookMapper.update(book) > 0;
    }

    @Override
    public boolean deleteById(Integer bookId) {
        if (bookId == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        return bookMapper.deleteById(bookId) > 0;
    }

    @Override
    public boolean updateStock(Integer bookId, Integer availableStock) {
        if (bookId == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        if (availableStock == null || availableStock < 0) {
            throw new IllegalArgumentException("Available stock cannot be null or negative");
        }
        return bookMapper.updateStock(bookId, availableStock) > 0;
    }
}
