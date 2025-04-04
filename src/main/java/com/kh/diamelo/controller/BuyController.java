package com.kh.diamelo.controller;

import com.kh.diamelo.services.BuyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@RequiredArgsConstructor
@Controller
public class BuyController {
    private final BuyService buyService;

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

    //구매 상세보기
    @GetMapping("detail.buy")
    public String detailBuy() {
        return "erpPage/buyDetailPage";
    }

    //재료구매신청 버튼
    @PostMapping("mat.buy")
    public String materialBuy() {
        return null;
    }

    @GetMapping("buyList.erp")
    public String buyList(){
        int buyCount = buyService.selectBuyCount();
        return "erpPage/buyPage";
    }


}
