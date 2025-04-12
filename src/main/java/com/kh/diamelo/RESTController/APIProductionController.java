package com.kh.diamelo.RESTController;


import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.ProductService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/production")
public class APIProductionController {

    private final ProductService productService;

    //ResponseEntity는 안정성을 위해 사용 404,400
    @GetMapping("/details")
    public ResponseEntity<HashMap<String, Object>> getProductDetails(@RequestParam("productNo") int productNo) {

        //제품 이미지와 레시피를 동시에 갖고오기 위해 맵을 사용하여 키와 값으로 저장함
        HashMap<String, Object> response = new HashMap<>();

        //  제품 이미지 가져오기
        String imagePath = productService.getProductImage(productNo);
        response.put("imagePath", imagePath);

        //  제품 레시피(재료 목록) 가져오기
        ArrayList<Product> materials = productService.getMaterialsByProductNo(productNo);
        response.put("materials", materials);

        //최대 생산 수량 가져오기
        int maxCount = productService.getMaxProductionCount(productNo);
        response.put("maxCount", maxCount);

        //리턴
        return ResponseEntity.ok(response);
    }

    @GetMapping("/cart")
    public String addDeleteCart(int proNo, boolean inCart, HttpSession session) {
        String result = "";

        // 회원 아이디 가져오기 - 장바구니 추가 삭제에 필요
        UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");
        String userId = loginUser.getUserId();


        if(inCart) { // 장바구니에 상품이 담겨있을시 -> 장바구니 삭제
            int deleteResult = productService.deleteCart(proNo,userId);
            System.out.println("deleteResult: " + deleteResult);
            if (deleteResult > 0) {
                result = "Del";
            }
        }else{ // 장바구니에 상품이 담겨있지 않을시 -> 장바구니 추가
            int addResult = productService.addCart(proNo, userId);
            System.out.println("addResult: " + addResult);
            if (addResult > 0) {
                result = "Add";
            }
        }
        return result;
    }

}
