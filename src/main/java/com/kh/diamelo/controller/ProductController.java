package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@Controller
public class ProductController {

    private final ProductService productService;

    //제작 페이지
    @GetMapping("prdc.erp")
    public String production(Model model,HttpSession session) {
        String svg = "/image/erpIcon/plus.png";


        ArrayList<Product> productList = productService.getProductList();

        // productList가 null인지 확인
        if (productList == null) {
            model.addAttribute("message", "등록된 제품이 없습니다.");
        } else {
            for (Product p : productList) {
                System.out.println("상품명: " + p.getProName());
            }
        }

        //jsp에 있는 select박스의 옵션들
        model.addAttribute("productList", productList);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "제작 관리");
        
        return "erpPage/productionPage";
    }

    //제작 기능
    @PostMapping("/create.pro")
    public String createProduct(@RequestParam("productNo") int productNo, @RequestParam("quantity") int quantity,
                                RedirectAttributes redirectAttributes) {

        boolean success = productService.produceProduct(productNo, quantity);

        if (success) {
            redirectAttributes.addFlashAttribute("message", "제품 제작 완료!");
            return "redirect:/prdc.erp";
        } else {
            redirectAttributes.addFlashAttribute("message", "재료 부족으로 제작 실패!");
            return "redirect:/prdc.erp";
        }
    }

}
