package com.suniceman.service;

import com.suniceman.po.User;

public interface UserService {
    
    User checkName(String name);
    
    void register(User user);
    
    User dologin(User user);
    
    User findById(int id);
    
    void updatePassword(User user);
    
}
