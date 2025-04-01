package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class EmployeeController {

    // 인사관리 페이지로 가기
    @GetMapping("employee.erp")
    public String employee() {
        return "erpPage/employeePage";
    }

    // 인사 관리자 페이지로 가기
    @GetMapping("empAdmin.erp")
    public String empAdmin() {return "erpPage/employeeAdminPage";}

    // 인사 상세 페이지로 가기
    @GetMapping("empDetail.erp")
    public String empDetail() {return "erpPage/employeeDetailPage";}

    //인사 상세 페이지에서 수정하기 눌렀을 때의 redirect
    @PostMapping("empAdmin.erp")
    public String empAdminPost() {return null;}

    @GetMapping("emplist.erp")
    public String emplist() {return "erpPage/employeeListPage";}



}
