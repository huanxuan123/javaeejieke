package com.library.service.impl;

import com.library.dao.BookMapper;
import com.library.dao.BorrowRecordMapper;
import com.library.dao.ReaderMapper;
import com.library.pojo.Book;
import com.library.pojo.BorrowRecord;
import com.library.pojo.Reader;
import com.library.service.BorrowRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Service
@Transactional
public class BorrowRecordServiceImpl implements BorrowRecordService {

    @Autowired
    private BorrowRecordMapper borrowRecordMapper;

    @Autowired
    private BookMapper bookMapper;

    @Autowired
    private ReaderMapper readerMapper;

    @Override
    public BorrowRecord findById(Integer recordId) {
        if (recordId == null) {
            throw new IllegalArgumentException("Record ID cannot be null");
        }
        return borrowRecordMapper.selectById(recordId);
    }

    @Override
    public List<BorrowRecord> findAll() {
        return borrowRecordMapper.selectAll();
    }

    @Override
    public List<BorrowRecord> findByReaderId(Integer readerId) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return borrowRecordMapper.selectByReaderId(readerId);
    }

    @Override
    public List<BorrowRecord> findByBookId(Integer bookId) {
        if (bookId == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        return borrowRecordMapper.selectByBookId(bookId);
    }

    @Override
    public List<BorrowRecord> findByCondition(Integer readerId, Integer bookId, Integer status) {
        return borrowRecordMapper.selectByCondition(readerId, bookId, status);
    }

    @Override
    public List<BorrowRecord> findAllWithDetails() {
        return borrowRecordMapper.selectWithDetails();
    }

    @Override
    public List<BorrowRecord> findByReaderIdWithDetails(Integer readerId) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return borrowRecordMapper.selectByReaderIdWithDetails(readerId);
    }

    @Override
    public boolean borrowBook(Integer readerId, Integer bookId) {
        if (readerId == null || bookId == null) {
            throw new IllegalArgumentException("Reader ID and Book ID cannot be null");
        }

        Reader reader = readerMapper.selectById(readerId);
        if (reader == null) {
            throw new RuntimeException("Reader not found");
        }
        if (reader.getStatus() != 1) {
            throw new RuntimeException("Reader account is disabled");
        }

        int currentBorrowedCount = borrowRecordMapper.countByReaderId(readerId, 1);
        if (currentBorrowedCount >= reader.getBorrowLimit()) {
            throw new RuntimeException("Borrow limit exceeded");
        }

        Book book = bookMapper.selectById(bookId);
        if (book == null) {
            throw new RuntimeException("Book not found");
        }
        if (book.getStatus() != 1) {
            throw new RuntimeException("Book is not available for borrowing");
        }
        if (book.getAvailableStock() <= 0) {
            throw new RuntimeException("Book is out of stock");
        }

        BorrowRecord borrowRecord = new BorrowRecord();
        borrowRecord.setBookId(bookId);
        borrowRecord.setReaderId(readerId);
        borrowRecord.setBorrowDate(new Date());
        
        Calendar calendar = Calendar.getInstance();
        calendar.add(Calendar.DAY_OF_MONTH, 14);
        borrowRecord.setDueDate(calendar.getTime());
        
        borrowRecord.setStatus(1);
        borrowRecord.setRemark("Borrowing");

        boolean result = borrowRecordMapper.insert(borrowRecord) > 0;

        if (result) {
            bookMapper.updateStock(bookId, book.getAvailableStock() - 1);
            readerMapper.updateBorrowedCount(readerId, currentBorrowedCount + 1);
        }

        return result;
    }

    @Override
    public boolean returnBook(Integer recordId) {
        if (recordId == null) {
            throw new IllegalArgumentException("Record ID cannot be null");
        }

        BorrowRecord borrowRecord = borrowRecordMapper.selectById(recordId);
        if (borrowRecord == null) {
            throw new RuntimeException("Borrow record not found");
        }
        if (borrowRecord.getStatus() != 1) {
            throw new RuntimeException("Book has already been returned");
        }

        borrowRecord.setReturnDate(new Date());
        borrowRecord.setStatus(2);
        borrowRecord.setRemark("Returned");

        boolean result = borrowRecordMapper.update(borrowRecord) > 0;

        if (result) {
            Book book = bookMapper.selectById(borrowRecord.getBookId());
            if (book != null) {
                bookMapper.updateStock(borrowRecord.getBookId(), book.getAvailableStock() + 1);
            }

            int currentBorrowedCount = borrowRecordMapper.countByReaderId(borrowRecord.getReaderId(), 1);
            readerMapper.updateBorrowedCount(borrowRecord.getReaderId(), currentBorrowedCount);
        }

        return result;
    }

    @Override
    public boolean save(BorrowRecord borrowRecord) {
        if (borrowRecord == null) {
            throw new IllegalArgumentException("Borrow record cannot be null");
        }
        if (borrowRecord.getBookId() == null) {
            throw new IllegalArgumentException("Book ID cannot be null");
        }
        if (borrowRecord.getReaderId() == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return borrowRecordMapper.insert(borrowRecord) > 0;
    }

    @Override
    public boolean update(BorrowRecord borrowRecord) {
        if (borrowRecord == null) {
            throw new IllegalArgumentException("Borrow record cannot be null");
        }
        if (borrowRecord.getRecordId() == null) {
            throw new IllegalArgumentException("Record ID cannot be null");
        }
        return borrowRecordMapper.update(borrowRecord) > 0;
    }

    @Override
    public boolean deleteById(Integer recordId) {
        if (recordId == null) {
            throw new IllegalArgumentException("Record ID cannot be null");
        }
        return borrowRecordMapper.deleteById(recordId) > 0;
    }

    @Override
    public int countByReaderId(Integer readerId, Integer status) {
        if (readerId == null) {
            throw new IllegalArgumentException("Reader ID cannot be null");
        }
        return borrowRecordMapper.countByReaderId(readerId, status);
    }
}
