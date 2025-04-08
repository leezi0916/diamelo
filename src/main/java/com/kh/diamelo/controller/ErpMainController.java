package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErpMainController {

    // 사내 메인홈페이지로 가기
    @GetMapping("home.erp")
    public String home() {



        return "erpPage/homePage";
    }

}

