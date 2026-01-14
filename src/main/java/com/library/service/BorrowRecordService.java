package com.library.service;

import com.library.pojo.BorrowRecord;

import java.util.List;

public interface BorrowRecordService {
    
    BorrowRecord findById(Integer recordId);
    
    List<BorrowRecord> findAll();
    
    List<BorrowRecord> findByReaderId(Integer readerId);
    
    List<BorrowRecord> findByBookId(Integer bookId);
    
    List<BorrowRecord> findByCondition(Integer readerId, Integer bookId, Integer status);
    
    List<BorrowRecord> findAllWithDetails();
    
    List<BorrowRecord> findByReaderIdWithDetails(Integer readerId);
    
    boolean borrowBook(Integer readerId, Integer bookId);
    
    boolean returnBook(Integer recordId);
    
    boolean save(BorrowRecord borrowRecord);
    
    boolean update(BorrowRecord borrowRecord);
    
    boolean deleteById(Integer recordId);
    
    int countByReaderId(Integer readerId, Integer status);
}
