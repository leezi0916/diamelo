package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Cart;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class ProductListController {

    private final ProductService productService;

    // 전체 상품 조회
    @GetMapping("productList.crm")
    public String productList(@RequestParam(defaultValue = "1") int cpage, Model model,HttpSession session) {
        // 회원 아이디 가져오기 - 장바구니 조회에 필요
        UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();

        // 제품 개수 조회
        int productCount = productService.selectProductCount();

        // 페이징 처리 - 10페이지 5개씩
        PageInfo pi = new PageInfo(productCount, cpage, 10, 5);

        // 제품 목록 가져오기
        ArrayList<Product> productList = productService.getCrmProductList(pi);

        // 장바구니 내역 가져오기
        ArrayList<Cart> cartList = productService.getCartList(userId);

        System.out.println(cartList);
        // 가져온 리스트가 비어있지 않을 때
        if (!productList.isEmpty()) {
            model.addAttribute("productList", productList);
            model.addAttribute("pi", pi);
            model.addAttribute("cartList", cartList);
            return "crmPage/productList";
        } else {
            // 빈 페이지 출력
            return "crmPage/productList";
        }

    }

    // 검색된 제품 조회
    @GetMapping("searchList.pro")
    public String searchProList(@RequestParam(defaultValue = "1")int cpage, String keyword, @RequestParam(defaultValue = "1") int searchLog, Model model) {

        if(keyword.equals("")) {
            return "redirect:/productList.crm";
        }

        // 제품 개수 조회
        int productCount = productService.selectSearchProductCount(keyword);

        // 페이징 처리 - 10페이지 5개씩
        PageInfo pi = new PageInfo(productCount, cpage, 10, 5);

        ArrayList<Product> productList = productService.getSearchCrmProductList(pi,keyword);

        // 가져온 리스트가 비어있지 않을 때
        if (!productList.isEmpty()) {
            model.addAttribute("productList", productList);
            model.addAttribute("pi", pi);
            model.addAttribute("searchLog", searchLog);
            return "crmPage/productList";
        } else {
            model.addAttribute("errorMsg", "상품을 가져오는데 실패하였습니다.");
            // 빈 페이지 출력
            return "crmPage/productList";
        }
    }

}
