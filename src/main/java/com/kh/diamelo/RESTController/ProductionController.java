package com.kh.diamelo.RESTController;


import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.services.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequiredArgsConstructor
public class ProductionController {

    private final ProductService productService;

    @GetMapping("/details")
    public ResponseEntity<Map<String, Object>> getProductDetails(@RequestParam("productNo") int productNo) {
        Map<String, Object> response = new HashMap<>();

        // ✅ 제품 이미지 가져오기
        String imagePath = productService.getProductImage(productNo);
        response.put("imagePath", imagePath);

        // ✅ 제품 레시피(재료 목록) 가져오기
        ArrayList<Product> materials = productService.getMaterialsByProductNo(productNo);
        response.put("materials", materials);

        return ResponseEntity.ok(response);
    }

}
