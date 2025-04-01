package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErpController {

    @GetMapping("home.erp")
    public String main() {
        return "erpPage/homePage";
    }
}
