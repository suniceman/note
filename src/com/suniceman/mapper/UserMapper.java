package com.suniceman.mapper;

import com.suniceman.po.User;

public interface UserMapper {
    
    User checkName(String name);
    
    void register(User user);
    
    User dologin(User user);
    
    User findById(int id);
    
    void updatePassword(User user);
}
