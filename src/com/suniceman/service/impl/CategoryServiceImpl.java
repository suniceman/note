package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.CategoryMapper;
import com.suniceman.po.Category;
import com.suniceman.service.CategoryService;

@Service
public class CategoryServiceImpl implements CategoryService {
    
    @Autowired
    private CategoryMapper categoryMapper;
    
    @Override
    public void save(Category category) {
        // TODO Auto-generated method stub
        categoryMapper.save(category);
    }
    
    @Override
    public List<Category> findByUserId(int id) {
        // TODO Auto-generated method stub
        return categoryMapper.findByUserId(id);
    }
    
    @Override
    public void del(int id) {
        // TODO Auto-generated method stub
        categoryMapper.del(id);
    }
    
    @Override
    public void update(Category category) {
        // TODO Auto-generated method stub
        categoryMapper.update(category);
    }
}
