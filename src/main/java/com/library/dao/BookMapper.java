package com.library.dao;

import com.library.pojo.Book;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMapper {
    
    Book selectById(@Param("bookId") Integer bookId);
    
    Book selectByIsbn(@Param("isbn") String isbn);
    
    List<Book> selectAll();
    
    List<Book> selectByCondition(@Param("title") String title, @Param("author") String author, 
                               @Param("category") String category, @Param("status") Integer status);
    
    List<Book> selectAvailableBooks();
    
    int insert(Book book);
    
    int update(Book book);
    
    int deleteById(@Param("bookId") Integer bookId);
    
    int updateStock(@Param("bookId") Integer bookId, @Param("availableStock") Integer availableStock);
}
