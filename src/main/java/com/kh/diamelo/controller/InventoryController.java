package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.List;

@RequiredArgsConstructor
@Controller
public class InventoryController {
    private final ProductService productService;

    // 재고관리 페이지로 가기
    @GetMapping("inv.erp")
    public String inventory(@RequestParam(defaultValue = "1") int cpage, Model model) {

        int productCount = productService.selectProductCount();
        model.addAttribute("pCount",productCount);
        System.out.println("productCount: " + productCount);

        int materialCount = productService.selectMaterialCount();
        model.addAttribute("mCount",materialCount);
        System.out.println("materialCount: " + materialCount);

        PageInfo pi = new PageInfo((productCount+materialCount), cpage, 10, 5);
        ArrayList<Product> list = productService.selectProductList(pi);

        System.out.println("list: " + list);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);


        /*
        int finishedProductCount = productService.countProductsByType("Y"); // 완제품 개수
        int materialProductCount = productService.countProductsByType("N"); // 재료 개수

        List<Product> finishedProducts = productService.getProductsByType("Y"); // 완제품 목록
        List<Product> materialProducts = productService.getProductsByType("N"); // 재료 목록


        model.addAttribute("finishedCount", finishedProductCount);
        model.addAttribute("materialCount", materialProductCount);
        model.addAttribute("finishedProducts", finishedProducts);
        model.addAttribute("materialProducts", materialProducts);

        System.out.println("완제품 목록: " + finishedProducts);
        System.out.println("재료 목록: " + materialProducts);
        */


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
