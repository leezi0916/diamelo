package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CrmController {
    @GetMapping("loginForm.me")
    public String loginForm() {
        return "crmPage/loginPage";
    }

    @GetMapping("signUpEnrollForm.me")
    public String signUpEnrollForm() {
        return "crmPage/signUpEnrollForm";
    }
}
