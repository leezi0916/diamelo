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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
            // 빈 페이지 출력
            return "crmPage/shoppingList";
        }
    }

    @PostMapping("insert.io")
    public String insertInout(
            // <ArrayList><Product>로 받으면
            // product[0].proName, product[0].proPrice 이런 식으로 네임이 지정되지 않으면
            // Product 객체 리스트로는 바인딩이 되지 않기 때문에
            // 각각의 요소를 ArrayList로받아서 Controller단에서 처리
            @RequestParam("proNo") ArrayList<Integer> proNoes,
            @RequestParam("proPrice") ArrayList<Integer> proPrices,
            @RequestParam("proStock") ArrayList<Integer> proStocks,
            @RequestParam("proName") ArrayList<String> proNames,
            HttpSession session,
            Model model
    ) {
        UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();

        // 1. 먼저 재고 체크만 실행
        for (int i = 0; i < proNoes.size(); i++) {
            int availableStock = productService.getProductStock(proNoes.get(i));
            if (proStocks.get(i) > availableStock) {
                model.addAttribute("errorMsg", proNames.get(i) + "의 남은 재고보다 주문하신 수량이 많습니다.");
                return "common/errorPage";
            }
        }

        // 2. 재고 체크 통과했으면 그룹 먼저 insert
        int resultGroup = productService.insertInoutGroup(userId);
        int resultHistory = 0;

        // 3. 내역 insert
        for (int i = 0; i < proNoes.size(); i++) {
            resultHistory = productService.insertInoutHistory(proNoes.get(i), proStocks.get(i), proPrices.get(i));
        }

        // 4. 성공 처리
        if (resultGroup * resultHistory > 0) {
            session.setAttribute("alertMsg", "디아멜로 제품을 주문해주셔서 감사합니다 !!");
            for (int i = 0; i < proNoes.size(); i++) {
                productService.deleteCart(proNoes.get(i), userId);
            }
            return "redirect:/shoppingList.crm";
        } else {
            model.addAttribute("errorMsg", "제품을 구매하는데 실패하였습니다.");
            return "common/errorPage";
        }
    }
}
