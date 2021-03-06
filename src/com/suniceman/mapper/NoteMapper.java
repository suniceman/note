package com.suniceman.mapper;

import java.util.List;

import com.suniceman.po.Note;

public interface NoteMapper {
    
    void create(Note note);
    
    List<Note> findByCategoryId(int categoryId);
    
    void del(int id);
    
    Note findById(int id);
    
    void updateNote(Note note);
    
    void deleteByCategoryId(int id);
    
}
