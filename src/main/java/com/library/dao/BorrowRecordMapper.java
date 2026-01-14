package com.library.dao;

import com.library.pojo.BorrowRecord;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BorrowRecordMapper {
    
    BorrowRecord selectById(@Param("recordId") Integer recordId);
    
    List<BorrowRecord> selectAll();
    
    List<BorrowRecord> selectByReaderId(@Param("readerId") Integer readerId);
    
    List<BorrowRecord> selectByBookId(@Param("bookId") Integer bookId);
    
    List<BorrowRecord> selectByCondition(@Param("readerId") Integer readerId, @Param("bookId") Integer bookId, 
                                      @Param("status") Integer status);
    
    List<BorrowRecord> selectWithDetails();
    
    List<BorrowRecord> selectByReaderIdWithDetails(@Param("readerId") Integer readerId);
    
    int insert(BorrowRecord borrowRecord);
    
    int update(BorrowRecord borrowRecord);
    
    int deleteById(@Param("recordId") Integer recordId);
    
    int countByReaderId(@Param("readerId") Integer readerId, @Param("status") Integer status);
}
