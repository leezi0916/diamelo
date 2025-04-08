package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class CrmController {

    private final ProductService productService;

    // 전체 상품 조회
    @GetMapping("productList.crm")
    public String productList(HttpSession session){

        ArrayList<Product> productList = productService.getCrmProductList();

        // 가져온 리스트가 비어있지 않을 때
        if (!productList.isEmpty()){
            session.setAttribute("productList", productList);
            return "crmPage/productList";
        }else {
            session.setAttribute("errorMsg","상품을 가져오는데 실패하였습니다.");
            return "common/errorPage";
        }
    }

    @GetMapping("a")
    public String a() {
        return "crmPage/productList";
    }
}
