package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CrmController {

    // 로그인 폼
    @GetMapping("loginForm.me")
    public String loginForm() {
        return "crmPage/loginPage";
    }

    // 회원가입 폼
    @GetMapping("signUpEnrollForm.me")
    public String signUpEnrollForm() {
        return "crmPage/signUpEnrollForm";
    }
}
