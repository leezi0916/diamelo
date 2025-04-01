package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CompanyController {

    // 거래관리 페이지로 가기
    @GetMapping("company.erp")
    public String company() {
        return "erpPage/companyMainPage";
    }

}
