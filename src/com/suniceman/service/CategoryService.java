package com.suniceman.service;

import java.util.List;

import com.suniceman.po.Category;

public interface CategoryService {
    
    void save(Category category);
    
    List<Category> findByUserId(int id);
    
    void del(int id);
    
    void update(Category category);
    
}
