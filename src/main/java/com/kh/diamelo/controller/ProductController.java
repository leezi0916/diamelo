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
        String svg = "<svg width=\"25\"\n" +
                "                                height=\"25\"\n" +
                "                                viewBox=\"0 0 25 25\"\n" +
                "                                fill=\"none\"\n" +
                "                                xmlns=\"http://www.w3.org/2000/svg\"\n" +
                "                                xmlns:xlink=\"http://www.w3.org/1999/xlink\">\n" +
                "                            <rect width=\"25\" height=\"25\" fill=\"url(#pattern0_240_5985)\" />\n" +
                "                            <defs>\n" +
                "                                <pattern id=\"pattern0_240_5985\"\n" +
                "                                        patternContentUnits=\"objectBoundingBox\"\n" +
                "                                        width=\"1\"\n" +
                "                                        height=\"1\">\n" +
                "                                    <use xlink:href=\"#image0_240_5985\" transform=\"scale(0.0104167)\" />\n" +
                "                                </pattern>\n" +
                "                                <image id=\"image0_240_5985\"\n" +
                "                                        width=\"96\"\n" +
                "                                        height=\"96\"\n" +
                "                                        preserveAspectRatio=\"none\"\n" +
                "                                        xlink:href=\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAA2UlEQVR4nO3VwQ3CMAAEQfff9FICL+SQm5FcAF5fOAcAAAAAnqsvBwHeLQsQYFoWIMC0LECAaVmAANOyAAGmZQECTMsCBJiWBQgwLQsQYFoWIMC0LECAaVmAANOyAAGmZQECTMsCBHj0C1w/P3f7B/bwI8AR4PorzALuX0Q+QfcvowvHf8AR4Por7M0LuK31C7gtAQSYlgUIMC0LEGBaFiDAtCxAgGlZgADTsgABpmUBAkzLAgSYlgUIMC0LEGBaFiDAtCxAgGlZgADTsgABpmUBAAAAAJw/9AFTazv9feL+wwAAAABJRU5ErkJggg==\"/>\n" +
                "                            </defs>\n" +
                "                        </svg>";


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
