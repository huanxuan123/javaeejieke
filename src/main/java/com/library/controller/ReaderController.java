package com.library.controller;

import com.library.pojo.Reader;
import com.library.service.ReaderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/reader")
public class ReaderController {

    @Autowired
    private ReaderService readerService;

    @GetMapping("/list")
    public String list(Model model) {
        List<Reader> readerList = readerService.findAll();
        model.addAttribute("readerList", readerList);
        return "reader/list";
    }

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String name,
                      @RequestParam(required = false) String studentNo,
                      @RequestParam(required = false) String department,
                      Model model) {
        List<Reader> readerList = readerService.findByCondition(name, studentNo, department);
        model.addAttribute("readerList", readerList);
        model.addAttribute("name", name);
        model.addAttribute("studentNo", studentNo);
        model.addAttribute("department", department);
        return "reader/list";
    }

    @GetMapping("/add")
    public String addPage() {
        return "reader/add";
    }

    @PostMapping("/add")
    @ResponseBody
    public String add(@RequestBody Reader reader) {
        try {
            boolean result = readerService.save(reader);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/edit/{id}")
    public String editPage(@PathVariable Integer id, Model model) {
        Reader reader = readerService.findById(id);
        model.addAttribute("reader", reader);
        return "reader/edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody Reader reader) {
        try {
            boolean result = readerService.update(reader);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable Integer id) {
        try {
            boolean result = readerService.deleteById(id);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/detail/{id}")
    public String detail(@PathVariable Integer id, Model model) {
        Reader reader = readerService.findById(id);
        model.addAttribute("reader", reader);
        return "reader/detail";
    }
}
