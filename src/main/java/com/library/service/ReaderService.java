package com.library.service;

import com.library.pojo.Reader;

import java.util.List;

public interface ReaderService {
    
    Reader findById(Integer readerId);
    
    Reader findByStudentNo(String studentNo);
    
    List<Reader> findAll();
    
    List<Reader> findByCondition(String name, String studentNo, String department);
    
    boolean save(Reader reader);
    
    boolean update(Reader reader);
    
    boolean deleteById(Integer readerId);
    
    boolean updateBorrowedCount(Integer readerId, Integer borrowedCount);
}
