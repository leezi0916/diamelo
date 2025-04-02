package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class ProductController {

    private final ProductService productService;
    @GetMapping("prdc.erp")
    public String production(Model model) {
        ArrayList<Product> productList = productService.getProductList();

        // 로그 추가
        System.out.println("🔹 불러온 제품 개수: " + productList.size());

        // productList가 null인지 확인
        if (productList == null) {
            System.out.println("⚠️ productList가 null입니다!");
        } else {
            for (Product p : productList) {
                System.out.println("📌 제품 정보: " + p); // 전체 데이터 출력
            }
        }

        model.addAttribute("productList", productList);
        return "erpPage/productionPage";
    }

}
