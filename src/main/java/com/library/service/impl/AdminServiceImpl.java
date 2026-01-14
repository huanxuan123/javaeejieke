package com.library.service.impl;

import com.library.dao.AdminMapper;
import com.library.pojo.Admin;
import com.library.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class AdminServiceImpl implements AdminService {

    @Autowired
    private AdminMapper adminMapper;

    @Override
    public Admin login(String username, String password) {
        Admin admin = adminMapper.login(username, password);
        if (admin == null) {
            throw new RuntimeException("Username or password is incorrect");
        }
        return admin;
    }

    @Override
    public Admin findById(Integer adminId) {
        if (adminId == null) {
            throw new IllegalArgumentException("Admin ID cannot be null");
        }
        return adminMapper.selectById(adminId);
    }

    @Override
    public List<Admin> findAll() {
        return adminMapper.selectAll();
    }

    @Override
    public boolean save(Admin admin) {
        if (admin == null) {
            throw new IllegalArgumentException("Admin cannot be null");
        }
        if (admin.getUsername() == null || admin.getUsername().trim().isEmpty()) {
            throw new IllegalArgumentException("Username cannot be empty");
        }
        if (admin.getPassword() == null || admin.getPassword().trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be empty");
        }
        return adminMapper.insert(admin) > 0;
    }

    @Override
    public boolean update(Admin admin) {
        if (admin == null) {
            throw new IllegalArgumentException("Admin cannot be null");
        }
        if (admin.getAdminId() == null) {
            throw new IllegalArgumentException("Admin ID cannot be null");
        }
        return adminMapper.update(admin) > 0;
    }

    @Override
    public boolean deleteById(Integer adminId) {
        if (adminId == null) {
            throw new IllegalArgumentException("Admin ID cannot be null");
        }
        return adminMapper.deleteById(adminId) > 0;
    }
}
