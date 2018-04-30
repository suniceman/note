package com.suniceman.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.suniceman.po.User;
import com.suniceman.service.UserService;
import com.suniceman.util.Md5Util;

@Controller
@RequestMapping("/user")
public class UserController {
    
    @Autowired
    private UserService userService;
    
    @RequestMapping("/login")
    public String login() {
        return "user/login";
    }
    
    @ResponseBody
    @RequestMapping("/checkName")
    public String checkName(HttpServletRequest request) {
        String name = request.getParameter("name");
        User user = userService.checkName(name);
        if (null != user) {
            return "error";
        }
        return "success";
    }
    
    @RequestMapping("/register")
    public @ResponseBody
    Map<String, String> register(@RequestBody User user) {
        user.setPassword(Md5Util.getMd5(user.getPassword()));
        userService.register(user);
        Map<String, String> map = new HashMap<String, String>();
        map.put("status", "ok");
        
        return map;
    }
    
    @RequestMapping("/dologin")
    public @ResponseBody
    Map<String, String> dologin(@RequestBody User user, HttpServletRequest request) {
        user.setPassword(Md5Util.getMd5(user.getPassword()));
        User loginUser = userService.dologin(user);
        Map<String, String> map = new HashMap<String, String>();
        HttpSession session = request.getSession();
        if (null != loginUser) {
            session.setAttribute("user", loginUser);
            map.put("status", "ok");
        } else {
            map.put("status", "faild");
        }
        
        return map;
    }
    
    @RequestMapping("/changePassword")
    public @ResponseBody
    String changePassword(HttpServletRequest request, HttpServletResponse resopnse) throws Exception {
        resopnse.setCharacterEncoding("UTF-8");
        String oldPassword = request.getParameter("oldpassword");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        User loginUser = userService.findById(user.getId());
        if (null != loginUser && !loginUser.getPassword().equals(Md5Util.getMd5(oldPassword))) {
            return "error";
        }
        
        user.setPassword(Md5Util.getMd5(password));
        
        userService.updatePassword(user);
        
        return "success";
    }
    
    @RequestMapping("/updatePassword")
    public String updatePassword(HttpServletRequest request) {
        return "user/updatePassword";
    }
    
    @RequestMapping("/profile")
    public String profile(Model model, HttpServletRequest request) {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        User loginUser = userService.findById(user.getId());
        model.addAttribute("loginUser", loginUser);
        return "user/profile";
    }
    
    @RequestMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "redirect:/user/login.action";
    }
    
}
