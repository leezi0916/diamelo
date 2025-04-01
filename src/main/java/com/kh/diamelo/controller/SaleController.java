package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class SaleController {

    // 판매관리 페이지로 가기
    @GetMapping("sale.erp")
    public String sale() {
        return "erpPage/salePage";
    }

    // 판매 상세보기
    @GetMapping("detail.sale")
    public String detailSale() {
        return "erpPage/saleDetailPage";
    }

    // 판매 승인
    @PostMapping("acc.sale")
    public String acceptSale() {
        return null;
    }

    // 판매 반려
    @PostMapping("ref.sale")
    public String refusalSale() {
        return null;
    }

}
