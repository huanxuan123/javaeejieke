package com.library.controller;

import com.library.pojo.Admin;
import com.library.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public String loginPage() {
        return "admin/login";
    }

    @PostMapping("/login")
    @ResponseBody
    public String login(@RequestParam String username, @RequestParam String password, HttpSession session) {
        try {
            Admin admin = adminService.login(username, password);
            session.setAttribute("admin", admin);
            return "success";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/list")
    public String list(Model model) {
        model.addAttribute("adminList", adminService.findAll());
        return "admin/list";
    }

    @GetMapping("/add")
    public String addPage() {
        return "admin/add";
    }

    @PostMapping("/add")
    @ResponseBody
    public String add(@RequestBody Admin admin) {
        try {
            boolean result = adminService.save(admin);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/edit/{id}")
    public String editPage(@PathVariable Integer id, Model model) {
        model.addAttribute("admin", adminService.findById(id));
        return "admin/edit";
    }

    @PostMapping("/edit")
    @ResponseBody
    public String edit(@RequestBody Admin admin) {
        try {
            boolean result = adminService.update(admin);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @PostMapping("/delete/{id}")
    @ResponseBody
    public String delete(@PathVariable Integer id) {
        try {
            boolean result = adminService.deleteById(id);
            return result ? "success" : "failed";
        } catch (Exception e) {
            return "error: " + e.getMessage();
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/admin/login";
    }
}
