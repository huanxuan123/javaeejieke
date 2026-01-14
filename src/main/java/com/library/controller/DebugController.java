package com.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/debug")
public class DebugController {

    @GetMapping("/info")
    public String debugInfo(HttpServletRequest request, Model model) {
        model.addAttribute("requestURL", request.getRequestURL());
        model.addAttribute("requestURI", request.getRequestURI());
        model.addAttribute("contextPath", request.getContextPath());
        model.addAttribute("servletPath", request.getServletPath());
        model.addAttribute("queryString", request.getQueryString());
        model.addAttribute("method", request.getMethod());
        model.addAttribute("remoteAddr", request.getRemoteAddr());
        model.addAttribute("serverName", request.getServerName());
        model.addAttribute("serverPort", request.getServerPort());
        model.addAttribute("scheme", request.getScheme());
        model.addAttribute("serverInfo", request.getServletContext().getServerInfo());
        return "debug";
    }

    @GetMapping("/ping")
    @org.springframework.web.bind.annotation.ResponseBody
    public String ping() {
        return "PONG - System is running!";
    }

    @GetMapping("/check")
    @org.springframework.web.bind.annotation.ResponseBody
    public String check(HttpServletRequest request) {
        StringBuilder sb = new StringBuilder();
        sb.append("=== System Check Report ===\n");
        sb.append("Timestamp: ").append(new java.util.Date()).append("\n");
        sb.append("Request URL: ").append(request.getRequestURL()).append("\n");
        sb.append("Context Path: ").append(request.getContextPath()).append("\n");
        sb.append("Request URI: ").append(request.getRequestURI()).append("\n");
        sb.append("Servlet Path: ").append(request.getServletPath()).append("\n");
        sb.append("Query String: ").append(request.getQueryString()).append("\n");
        sb.append("Method: ").append(request.getMethod()).append("\n");
        sb.append("Remote Addr: ").append(request.getRemoteAddr()).append("\n");
        sb.append("Server Name: ").append(request.getServerName()).append("\n");
        sb.append("Server Port: ").append(request.getServerPort()).append("\n");
        sb.append("Scheme: ").append(request.getScheme()).append("\n");
        return sb.toString();
    }

    @GetMapping("/routes")
    @org.springframework.web.bind.annotation.ResponseBody
    public String routes() {
        return "=== Available Routes ===\n" +
               "GET  /                  -> index.jsp\n" +
               "GET  /index            -> index.jsp\n" +
               "GET  /admin/login       -> admin/login.jsp\n" +
               "POST /admin/login       -> login action\n" +
               "GET  /book/list        -> book/list.jsp\n" +
               "GET  /book/add         -> book/add.jsp\n" +
               "GET  /book/edit/{id}   -> book/edit.jsp\n" +
               "GET  /reader/list      -> reader/list.jsp\n" +
               "GET  /reader/add       -> reader/add.jsp\n" +
               "GET  /reader/edit/{id}  -> reader/edit.jsp\n" +
               "GET  /borrow/list      -> borrow/list.jsp\n" +
               "GET  /borrow/borrow     -> borrow/borrow.jsp\n" +
               "GET  /debug/info       -> debug.jsp\n" +
               "GET  /debug/ping       -> PONG\n" +
               "GET  /debug/check       -> System check\n" +
               "GET  /debug/routes      -> Route list";
    }
}
