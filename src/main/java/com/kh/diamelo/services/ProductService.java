package com.kh.diamelo.services;



import com.kh.diamelo.domain.vo.Product;

import java.util.ArrayList;
import java.util.Map;

public interface ProductService {
    ArrayList<Product> getProductList();

    String getProductImage(int productNo);

    ArrayList<Product> getMaterialsByProductNo(int productNo);

    boolean produceProduct(int productNo, int quantity);

}
