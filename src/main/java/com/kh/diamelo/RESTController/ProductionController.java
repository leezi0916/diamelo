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

        //리턴
        return ResponseEntity.ok(response);
    }

}
