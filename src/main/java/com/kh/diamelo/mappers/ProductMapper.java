package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface ProductMapper {

    ArrayList<Product> getProductList();

    String getProductImage(int productNo);

    ArrayList<Product> getMaterialsByProductNo(@Param("productNo")int productNo);

    ArrayList<Product> getMaterialStock(@Param("productNo") int productNo); // 재료 재고 조회
    void increaseProductStock(int productNo, int quantity); // 제품 재고 증가
    void decreaseMaterialStock(int productNo, int quantity); // 재료 재고 차감
}
