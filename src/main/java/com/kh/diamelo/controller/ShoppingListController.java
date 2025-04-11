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
public class ShoppingListController {

    private final ProductService productService;

    // 장바구니 상품 조회
    @GetMapping("shoppingList.crm")
    public String cartList(@RequestParam(defaultValue = "1") int cpage, Model model, HttpSession session) {
        // 회원 아이디 가져오기 - 장바구니 조회에 필요
        UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();

        // 제품 목록 가져오기 - 오버로딩된 메서드 이용
        ArrayList<Product> productList = productService.getCrmProductList();

        // 장바구니 내역 가져오기
        ArrayList<Cart> cartList = productService.getCartList(userId);

        System.out.println(cartList);
        // 가져온 리스트가 비어있지 않을 때
        if (!productList.isEmpty()) {
            model.addAttribute("productList", productList);
            model.addAttribute("cartList", cartList);
            return "crmPage/shoppingList";
        } else {
            model.addAttribute("errorMsg", "상품을 가져오는데 실패하였습니다.");
            return "common/errorPage";
        }

    }
}
