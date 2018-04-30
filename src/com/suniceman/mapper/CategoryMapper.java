package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.Category;

public interface CategoryMapper {
    
    void save(Category category);
    
    List<Category> findByUserId(int id);
    
    void del(int id);
    
    void update(Category category);
    
}
