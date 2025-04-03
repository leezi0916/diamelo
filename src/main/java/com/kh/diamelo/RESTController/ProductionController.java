package com.kh.diamelo.RESTController;


import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/production")
public class ProductionController {

    private final ProductService productService;

    @GetMapping("/details")
    public ResponseEntity<HashMap<String, Object>> getProductDetails(@RequestParam("productNo") int productNo) {
        HashMap<String, Object> response = new HashMap<>();

        // ✅ 제품 이미지 가져오기
        String imagePath = productService.getProductImage(productNo);
        response.put("imagePath", imagePath);

        // ✅ 제품 레시피(재료 목록) 가져오기
        ArrayList<Product> materials = productService.getMaterialsByProductNo(productNo);
        response.put("materials", materials);

        return ResponseEntity.ok(response);
    }

//    @PostMapping("/create")
//    public ResponseEntity<HashMap<String, String>> createProduct(@RequestBody HashMap<String, Integer> request) {
//        int productNo = request.get("productNo");
//        int quantity = request.get("quantity");
//
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
//    }

}
