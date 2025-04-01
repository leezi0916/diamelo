package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ProductionController {

    // 제작관리 페이지로 가기
    @GetMapping("prdc.erp")
    public String production() {
        return "erpPage/productionPage";
    }

    // 제품제작 버튼 클릭시
    @PostMapping("create.pro")
    public String insertIngredient() {
        return null;
    }

}
