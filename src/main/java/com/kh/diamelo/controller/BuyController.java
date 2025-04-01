package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class BuyController {

    // 구매관리 페이지로 가기
    @GetMapping("buy.erp")
    public String buy() {
        return "erpPage/buyPage";
    }

    // 구매조회
    @GetMapping("search.buy")
    public String searchBuy() {
        return null;
    }

    // 구매서 등록
    @GetMapping("buyAdd.erp")
    public String buyAddPage() {
        return "erpPage/materialBuyPage";
    }

    //재료구매신청 버튼
    @PostMapping("mat.buy")
    public String materialBuy() {
        return null;
    }
}
