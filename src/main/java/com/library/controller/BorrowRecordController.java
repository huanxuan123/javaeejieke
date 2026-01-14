package com.library.controller;

import com.library.pojo.BorrowRecord;
import com.library.service.BorrowRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/borrow")
public class BorrowRecordController {

    @Autowired
    private BorrowRecordService borrowRecordService;

    @Autowired
    private com.library.service.ReaderService readerService;

    @Autowired
    private com.library.service.BookService bookService;

    @GetMapping("/list")
    public String list(Model model) {
        List<BorrowRecord> recordList = borrowRecordService.findAllWithDetails();
        model.addAttribute("recordList", recordList);
        return "borrow/list";
    }

    @GetMapping("/reader/{readerId}")
    public String listByReader(@PathVariable Integer readerId, Model model) {
        List<BorrowRecord> recordList = borrowRecordService.findByReaderIdWithDetails(readerId);
        model.addAttribute("recordList", recordList);
        model.addAttribute("readerId", readerId);
        return "borrow/list";
    }

    @GetMapping("/borrow")
    public String borrowPage(Model model) {
        model.addAttribute("readerList", readerService.findAll());
        model.addAttribute("bookList", bookService.findAvailableBooks());
        return "borrow/borrow";
    }

    @PostMapping("/borrow")
    @ResponseBody
    public String borrow(@RequestParam Integer readerId, @RequestParam Integer bookId) {
        try {
            boolean result = borrowRecordService.borrowBook(readerId, bookId);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @PostMapping("/return/{recordId}")
    @ResponseBody
    public String returnBook(@PathVariable Integer recordId) {
        try {
            boolean result = borrowRecordService.returnBook(recordId);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/detail/{recordId}")
    public String detail(@PathVariable Integer recordId, Model model) {
        BorrowRecord record = borrowRecordService.findById(recordId);
        model.addAttribute("record", record);
        return "borrow/detail";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) Integer readerId,
                       @RequestParam(required = false) Integer bookId,
                       @RequestParam(required = false) Integer status,
                       Model model) {
        List<BorrowRecord> recordList = borrowRecordService.findByCondition(readerId, bookId, status);
        model.addAttribute("recordList", recordList);
        model.addAttribute("readerId", readerId);
        model.addAttribute("bookId", bookId);
        model.addAttribute("status", status);
        return "borrow/list";
    }
}
