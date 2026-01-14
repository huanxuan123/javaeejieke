package com.library.controller;

import com.library.pojo.Book;
import com.library.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    private BookService bookService;

    @GetMapping("/list")
    public String list(Model model) {
        List<Book> bookList = bookService.findAll();
        model.addAttribute("bookList", bookList);
        return "book/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String title,
                      @RequestParam(required = false) String author,
                      @RequestParam(required = false) String category,
                      @RequestParam(required = false) Integer status,
                      Model model) {
        List<Book> bookList = bookService.findByCondition(title, author, category, status);
        model.addAttribute("bookList", bookList);
        model.addAttribute("title", title);
        model.addAttribute("author", author);
        model.addAttribute("category", category);
        model.addAttribute("status", status);
        return "book/list";
    }

    @GetMapping("/available")
    public String available(Model model) {
        List<Book> bookList = bookService.findAvailableBooks();
        model.addAttribute("bookList", bookList);
        return "book/list";
    }

    @GetMapping("/add")
    public String addPage() {
        return "book/add";
    }

    @PostMapping("/add")
    @ResponseBody
    public String add(@RequestBody Book book) {
        try {
            boolean result = bookService.save(book);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/edit/{id}")
    public String editPage(@PathVariable Integer id, Model model) {
        Book book = bookService.findById(id);
        model.addAttribute("book", book);
        return "book/edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody Book book) {
        try {
            boolean result = bookService.update(book);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable Integer id) {
        try {
            boolean result = bookService.deleteById(id);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        Book book = bookService.findById(id);
        model.addAttribute("book", book);
        return "book/detail";
    }
}
