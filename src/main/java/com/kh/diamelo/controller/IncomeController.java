package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IncomeController {

    // 매출관리 페이지로 가기
    @GetMapping("income.erp")
    public String income() {
        return "erpPage/incomePage";
    }

    // 매출 상세보기
    @GetMapping("detail.in")
    public String detailIncome() {
        return "erpPage/incomeDetailPage";
    }
}
