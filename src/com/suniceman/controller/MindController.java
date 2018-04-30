package com.suniceman.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/mind")
public class MindController {
    @RequestMapping("/create")
    public String create() {
        return "mind/create";
    }
}
