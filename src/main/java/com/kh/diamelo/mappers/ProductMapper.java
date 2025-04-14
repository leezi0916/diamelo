package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Cart;
import com.kh.diamelo.domain.vo.Product;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;
import org.springframework.security.core.parameters.P;

import java.util.ArrayList;


@Mapper
public interface ProductMapper {


    ArrayList<Product> getProductList();

    String getProductImage(int productNo);

    // 제품에 필요한 재료 목록 조회
    ArrayList<Product> getMaterialsByProductNo(@Param("productNo")int productNo);


    // 특정 제품의 재고 가져오기
    ArrayList<Product> getMaterialStock(@Param("productNo") int productNo);
    //재료 재고 업데이트
    void increaseProductStock(@Param("productNo") int productNo, @Param("quantity") int quantity);
    void decreaseMaterialStock(@Param("productNo") int productNo, @Param("quantity") int quantity);

    //제품 최대 몇개 제작가능인지
    int getMaxProductionCount(@Param("productNo") int productNo);

    // crmPage 제품 목록 조회
    ArrayList<Product> getCrmProductList(RowBounds rowBounds);

    // 제품 개수 조회
    int selectProductCount();

    // 검색된 제품 개수 조회
    int selectSearchProductCount(@Param("keyword") String keyword);

    // crmPage 검색된 제품 목록 조회
    ArrayList<Product> getSearchCrmProductList(RowBounds rowBounds, String keyword);

    // 장바구니 목록 조회
    ArrayList<Cart> getCartList(@Param("userId") String userId);

    // 장바구니 추가
    int addCart(@Param("proNo") int proNo, @Param("userId") String userId);

    // 장바구니 삭제
    int deleteCart(@Param("proNo") int proNo, @Param("userId") String userId);

    // 장바구니 페이지 제품 정보 조회 - 오버로딩
    ArrayList<Product> getCrmProductList();

    // 제품 입출고 정보 묶음
    int insertInoutGroup(@Param("userId") String userId);

    // 제품 입출고 내역 추가
    int insertInoutHistory(@Param("proNo") int proNo,@Param("proStock") int proStock, @Param("totalPrice") int totalPrice);

    // 장바구니의 해당 재품 개수 조회
    int getProductStock(@Param("proNo") Integer proNo);
}
