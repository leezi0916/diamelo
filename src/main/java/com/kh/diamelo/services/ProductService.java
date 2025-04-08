package com.kh.diamelo.services;



import com.kh.diamelo.domain.vo.Product;

import java.util.ArrayList;
import java.util.Map;

public interface ProductService {

    // erpPage 제품 정보 조회
    ArrayList<Product> getProductList();

    // crmPage 제품 정보 조회
    ArrayList<Product> getCrmProductList();

    // 제품 이미지 조회
    String getProductImage(int productNo);

    ArrayList<Product> getMaterialsByProductNo(int productNo);

    boolean produceProduct(int productNo, int quantity);


}
