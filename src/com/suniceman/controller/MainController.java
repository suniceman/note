package com.suniceman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/main")
public class MainController {
    
    @RequestMapping("/main")
    public String main() {
        return "main/main";
    }
    
    @RequestMapping("/content")
    public String content() {
        return "main/content";
    }
}
