package com.library.service;

import com.library.pojo.Book;

import java.util.List;

public interface BookService {
    
    Book findById(Integer bookId);
    
    Book findByIsbn(String isbn);
    
    List<Book> findAll();
    
    List<Book> findByCondition(String title, String author, String category, Integer status);
    
    List<Book> findAvailableBooks();
    
    boolean save(Book book);
    
    boolean update(Book book);
    
    boolean deleteById(Integer bookId);
    
    boolean updateStock(Integer bookId, Integer availableStock);
}
