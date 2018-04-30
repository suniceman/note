package com.suniceman.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.suniceman.mapper.NoteMapper;
import com.suniceman.po.Note;
import com.suniceman.service.NoteService;

@Service
public class NoteServiceImpl implements NoteService {
    
    @Autowired
    private NoteMapper noteMapper;
    
    @Override
    public void create(Note note) {
        // TODO Auto-generated method stub
        noteMapper.create(note);
    }
    
    @Override
    public List<Note> findByCategoryId(int categoryId) {
        // TODO Auto-generated method stub
        return noteMapper.findByCategoryId(categoryId);
    }
    
    @Override
    public void del(int id) {
        // TODO Auto-generated method stub
        noteMapper.del(id);
    }
    
    @Override
    public Note findById(int id) {
        // TODO Auto-generated method stub
        return noteMapper.findById(id);
    }
    
    @Override
    public void updateNote(Note note) {
        // TODO Auto-generated method stub
        noteMapper.updateNote(note);
    }
    
    @Override
    public void deleteByCategoryId(int id) {
        // TODO Auto-generated method stub
        noteMapper.deleteByCategoryId(id);
    }
}
