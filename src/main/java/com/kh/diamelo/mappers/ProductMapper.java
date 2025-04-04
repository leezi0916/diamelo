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

//    제품에 필요한 재료 목록 조회
    ArrayList<Product> getMaterialsByProductNo(@Param("productNo")int productNo);


    //  특정 제품의 재고 가져오기
    ArrayList<Product> getMaterialStock(@Param("productNo") int productNo);
    //재료 재고 업데이트
    void increaseProductStock(@Param("productNo") int productNo, @Param("quantity") int quantity);
    void decreaseMaterialStock(@Param("productNo") int productNo, @Param("quantity") int quantity);

}
