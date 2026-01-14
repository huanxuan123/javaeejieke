package com.library.dao;

import com.library.pojo.Reader;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ReaderMapper {
    
    Reader selectById(@Param("readerId") Integer readerId);
    
    Reader selectByStudentNo(@Param("studentNo") String studentNo);
    
    List<Reader> selectAll();
    
    List<Reader> selectByCondition(@Param("name") String name, @Param("studentNo") String studentNo, @Param("department") String department);
    
    int insert(Reader reader);
    
    int update(Reader reader);
    
    int deleteById(@Param("readerId") Integer readerId);
    
    int updateBorrowedCount(@Param("readerId") Integer readerId, @Param("borrowedCount") Integer borrowedCount);
}
