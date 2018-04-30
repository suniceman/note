package com.suniceman.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.UserMapper;
import com.suniceman.po.User;
import com.suniceman.service.UserService;

@Service
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserMapper userMapper;
    
    @Override
    public User checkName(String name) {
        return userMapper.checkName(name);
    }
    
    @Override
    public void register(User user) {
        // TODO Auto-generated method stub
        userMapper.register(user);
    }
    
    @Override
    public User dologin(User user) {
        // TODO Auto-generated method stub
        return userMapper.dologin(user);
    }
    
    @Override
    public User findById(int id) {
        // TODO Auto-generated method stub
        return userMapper.findById(id);
    }
    
    @Override
    public void updatePassword(User user) {
        // TODO Auto-generated method stub
        userMapper.updatePassword(user);
    }
    
}
