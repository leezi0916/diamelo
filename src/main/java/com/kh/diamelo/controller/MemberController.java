package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class MemberController {

    @GetMapping("signUp.me")
    public String signUp() {
        return "crmPage/signUpEnrollForm";
    }

    @PostMapping("login.me")
    public String login() {
        return "crmPage/mainPage";
    }
}
