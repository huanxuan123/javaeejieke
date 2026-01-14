package com.library.service.impl;

import com.library.dao.ReaderMapper;
import com.library.pojo.Reader;
import com.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ReaderServiceImpl implements ReaderService {

    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public Reader findById(Integer readerId) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return readerMapper.selectById(readerId);
    }

    @Override
    public Reader findByStudentNo(String studentNo) {
        if (studentNo == null || studentNo.trim().isEmpty()) {
            throw new IllegalArgumentException("Student number cannot be empty");
        }
        return readerMapper.selectByStudentNo(studentNo);
    }

    @Override
    public List<Reader> findAll() {
        return readerMapper.selectAll();
    }

    @Override
    public List<Reader> findByCondition(String name, String studentNo, String department) {
        return readerMapper.selectByCondition(name, studentNo, department);
    }

    @Override
    public boolean save(Reader reader) {
        if (reader == null) {
            throw new IllegalArgumentException("Reader cannot be null");
        }
        if (reader.getStudentNo() == null || reader.getStudentNo().trim().isEmpty()) {
            throw new IllegalArgumentException("Student number cannot be empty");
        }
        if (reader.getName() == null || reader.getName().trim().isEmpty()) {
            throw new IllegalArgumentException("Reader name cannot be empty");
        }
        if (reader.getBorrowLimit() == null) {
            reader.setBorrowLimit(5);
        }
        if (reader.getBorrowedCount() == null) {
            reader.setBorrowedCount(0);
        }
        if (reader.getStatus() == null) {
            reader.setStatus(1);
        }
        return readerMapper.insert(reader) > 0;
    }

    @Override
    public boolean update(Reader reader) {
        if (reader == null) {
            throw new IllegalArgumentException("Reader cannot be null");
        }
        if (reader.getReaderId() == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return readerMapper.update(reader) > 0;
    }

    @Override
    public boolean deleteById(Integer readerId) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return readerMapper.deleteById(readerId) > 0;
    }

    @Override
    public boolean updateBorrowedCount(Integer readerId, Integer borrowedCount) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        if (borrowedCount == null || borrowedCount < 0) {
            throw new IllegalArgumentException("Borrowed count cannot be null or negative");
        }
        return readerMapper.updateBorrowedCount(readerId, borrowedCount) > 0;
    }
}
