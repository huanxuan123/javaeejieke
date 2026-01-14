package com.library.dao;

import com.library.pojo.Admin;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AdminMapper {
    
    Admin selectById(@Param("adminId") Integer adminId);
    
    Admin selectByUsername(@Param("username") String username);
    
    Admin login(@Param("username") String username, @Param("password") String password);
    
    List<Admin> selectAll();
    
    int insert(Admin admin);
    
    int update(Admin admin);
    
    int deleteById(@Param("adminId") Integer adminId);
}
