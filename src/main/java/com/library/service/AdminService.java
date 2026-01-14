package com.library.service;

import com.library.pojo.Admin;

import java.util.List;

public interface AdminService {
    
    Admin login(String username, String password);
    
    Admin findById(Integer adminId);
    
    List<Admin> findAll();
    
    boolean save(Admin admin);
    
    boolean update(Admin admin);
    
    boolean deleteById(Integer adminId);
}
