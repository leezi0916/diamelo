package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class EmployeeController {

    // 인사관리 페이지로 가기
    @GetMapping("employee.erp")
    public String employee() {
        return "erpPage/employeePage";
    }

}
