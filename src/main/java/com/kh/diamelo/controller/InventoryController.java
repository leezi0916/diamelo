package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class InventoryController {

    // 재고관리 페이지로 가기
    @GetMapping("inv.erp")
    public String inventory() {
        return "erpPage/inventoryMainPage";
    }


    // ------------ 제품 -----------------

    //제품조회
    @GetMapping("select.pro")
    public String selectProduct() {
        return null;
    }

    // 제품등록 페이지로 가기
    @GetMapping("proAdd.erp")
    public String proAddPage() {
        return "erpPage/insertProductPage";
    }

    // 제품등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("insert.pro")
    public String insertIngredient() {
        return null;
    }



    // ------------ 재료 -----------------

    //재료조회
    @GetMapping("select.ing")
    public String selectIngredient() {
        return null;
    }

    // 재료등록 페이지로 가기
    @GetMapping("ingAdd.erp")
    public String ingAddPage() {
        return "erpPage/insertIngredientPage";
    }

    // 재료등록 버튼 클릭시 (* redirect 해야함)
    @PostMapping("insert.ing")
    public String insertProduct() {
        return null;
    }

}
