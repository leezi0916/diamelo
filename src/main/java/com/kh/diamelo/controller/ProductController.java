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
    @GetMapping("prdc.erp")
    public String production(Model model) {
        ArrayList<Product> productList = productService.getProductList();

        // 로그 추가
//        System.out.println("불러온 제품 개수: " + productList.size());

        // productList가 null인지 확인
        if (productList == null) {
//            System.out.println("⚠productList가 null입니다!");
        } else {
            for (Product p : productList) {
//                System.out.println("제품 정보: " + p); // 전체 데이터 출력
            }
        }

        model.addAttribute("productList", productList);
        return "erpPage/productionPage";
    }

//    @PostMapping("/create.pro")
//    public ResponseEntity<HashMap<String, String>> createProduct(@RequestParam("productNo") int productNo,
//                                                                 @RequestParam("quantity") int quantity) {
//        boolean success = productService.produceProduct(productNo, quantity);
//
//        HashMap<String, String> response = new HashMap<>();
//        if (success) {
//            response.put("message", "제품 제작 완료!");
//            return ResponseEntity.ok(response);
//        } else {
//            response.put("message", "재료 부족으로 제작 실패!");
//            return ResponseEntity.badRequest().body(response);
//        }
//
//
//    }

    @PostMapping("/create.pro")
    public String createProduct(@RequestParam("productNo") int productNo, @RequestParam("quantity") int quantity,
                                RedirectAttributes redirectAttributes, HttpSession session) {
        boolean success = productService.produceProduct(productNo, quantity);

        if (success) {
            redirectAttributes.addFlashAttribute("message", "제품 제작 완료!");
            return "redirect:/prdc.erp";
        } else {
            redirectAttributes.addFlashAttribute("error", "재료 부족으로 제작 실패!");
            return "common/errorPage";
        }
    }

}
