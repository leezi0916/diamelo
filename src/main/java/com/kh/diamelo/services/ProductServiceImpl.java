package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Map;

@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;


    @Override
    public ArrayList<Product> getProductList() {
        ArrayList<Product> productList = productMapper.getProductList();

        // 로그 추가
        if (productList == null) {
            System.out.println("⚠️ productList가 null입니다.");
        } else {
            System.out.println("✅ productList 크기: " + productList.size());
            for (Product p : productList) {
                System.out.println("📌 제품 정보: " + p);
            }
        }

        return productList;
    }

    // 제품 이미지 조회
    @Override
    public String getProductImage(int productNo) {
        return productMapper.getProductImage(productNo);
    }

    // 특정 제품의 재료 목록 조회
    @Override
    public ArrayList<Product> getMaterialsByProductNo(int productNo) {
        return productMapper.getMaterialsByProductNo(productNo);
    }
}
