package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SaleController {

    // 판매관리 페이지로 가기
    @GetMapping("sale.erp")
    public String sale() {
        return "erpPage/salePage";
    }

}
