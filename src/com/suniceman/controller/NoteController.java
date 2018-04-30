package com.suniceman.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.suniceman.po.Category;
import com.suniceman.po.Note;
import com.suniceman.po.User;
import com.suniceman.service.CategoryService;
import com.suniceman.service.NoteService;

@Controller
@RequestMapping("/note")
public class NoteController {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private NoteService noteService;
    
    @RequestMapping("/add")
    public String add(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Category> categories = categoryService.findByUserId(user.getId());
        model.addAttribute("categories", categories);
        return "note/add";
    }
    
    @RequestMapping("/create")
    public String create(HttpServletRequest request, Model model, Note note) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        note.setUserId(user.getId());
        noteService.create(note);
        return "redirect:/note/list.action";
    }
    
    @RequestMapping("/list")
    public String list(HttpServletRequest request, Model model) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Category> categories = categoryService.findByUserId(user.getId());
        String idStr = request.getParameter("categoryId");
        int categoryId;
        if (null != idStr) {
            categoryId = Integer.parseInt(idStr);
        } else if (!categories.isEmpty() && categories.size() != 0) {
            categoryId = categories.get(0).getId();
        } else {
            categoryId = 0;
        }
        List<Note> notes = noteService.findByCategoryId(categoryId);
        model.addAttribute("categories", categories);
        model.addAttribute("notes", notes);
        return "note/list";
    }
    
    @RequestMapping("/del")
    public String del(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteService.findById(id);
        noteService.del(id);
        
        return "redirect:/note/list.action?categoryId=" + note.getCategoryId();
    }
    
    @RequestMapping("/view")
    public String view(HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteService.findById(id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Category> categories = categoryService.findByUserId(user.getId());
        model.addAttribute("categories", categories);
        model.addAttribute("note", note);
        
        return "note/view";
    }
    
    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        Note note = noteService.findById(id);
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        List<Category> categories = categoryService.findByUserId(user.getId());
        model.addAttribute("categories", categories);
        model.addAttribute("note", note);
        
        return "note/edit";
    }
    
    @RequestMapping("/updateNote")
    public String updateNote(HttpServletRequest request, Model model, Note note) {
        noteService.updateNote(note);
        
        return "redirect:/note/list.action?categoryId=" + note.getCategoryId();
    }
}
