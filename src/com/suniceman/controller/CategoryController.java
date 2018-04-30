package com.suniceman.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suniceman.po.Category;
import com.suniceman.po.User;
import com.suniceman.service.CategoryService;
import com.suniceman.service.NoteService;

@Controller
@RequestMapping("/category")
public class CategoryController {
    
    @Autowired
    private CategoryService categoryService;
    
    @Autowired
    private NoteService noteService;
    
    @RequestMapping("/addCategory")
    public String add() {
        return "category/add";
    }
    
    @RequestMapping("/create")
    public String create(HttpServletRequest request, Category category) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        category.setUserId(user.getId());
        categoryService.save(category);
        return "category/list";
    }
    
    @RequestMapping("/showMyCategory")
    public String showMyCategory() {
        return "category/list";
    }
    
    @ResponseBody
    @RequestMapping("/getList")
    public Object getList(HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        Map<String, Object> result = new HashMap<String, Object>();
        List<Category> categories = categoryService.findByUserId(user.getId());
        result.put("code", 0);
        result.put("message", "");
        result.put("data", categories);
        
        return result;
    }
    
    @RequestMapping("/del")
    public @ResponseBody
    Map<String, String> del(HttpServletRequest request) {
        Map<String, String> map = new HashMap<String, String>();
        int id = Integer.parseInt(request.getParameter("id"));
        categoryService.del(id);
        noteService.deleteByCategoryId(id);
        map.put("status", "ok");
        return map;
    }
    
    @RequestMapping("/update")
    public @ResponseBody
    Map<String, String> dologin(@RequestBody Category category, HttpServletRequest request) {
        System.out.println(category);
        categoryService.update(category);
        Map<String, String> map = new HashMap<String, String>();
        map.put("status", "ok");
        return map;
    }
}
