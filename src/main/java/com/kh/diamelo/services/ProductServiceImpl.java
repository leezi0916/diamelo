package com.kh.diamelo.services;


import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;


@RequiredArgsConstructor
@Service
public class ProductServiceImpl implements ProductService {

    private final ProductMapper productMapper;

    // erpPage 제품 정보 조회
    @Override
    public ArrayList<Product> getProductList() {
        ArrayList<Product> productList = productMapper.getProductList();

        // 로그 추가
        if (productList == null) {
            System.out.println("productList가 null입니다.");
        } else {
            System.out.println(" productList 크기: " + productList.size());
            for (Product p : productList) {
                System.out.println("제품 정보: " + p);
            }
        }

        return productList;
    }

    // crmPage 제품 정보 조회
    @Override
    public ArrayList<Product> getCrmProductList() {
        ArrayList<Product> productList = productMapper.getCrmProductList();

        // 로그 추가
        if (productList == null) {
            System.out.println("⚠productList가 null입니다.");
        } else {
            System.out.println(" productList 크기: " + productList.size());
            for (Product p : productList) {
                System.out.println("제품 정보: " + p);
            }
        }

        return productList;
    }

    // 제품 이미지 조회
    @Override
    public String getProductImage(int productNo) {

        return productMapper.getProductImage(productNo);
    }

    @Override
    public ArrayList<Product> getMaterialsByProductNo(int productNo) {
        ArrayList<Product> materials = productMapper.getMaterialsByProductNo(productNo);

        // 디버깅용 로그
        if (materials == null) {
            System.out.println("materials가 null입니다.");
        } else {
            System.out.println(" 가져온 재료 개수: " + materials.size());
            for (Product m : materials) {
                System.out.println(" 재료 정보: " + m);
            }
        }

        return materials;
    }


//    제품 생성 파트
    @Transactional
    //모두 성공해야만 db에 반영
    @Override

    public boolean produceProduct(int productNo, int quantity) {
        //  특정제품의 필요한 재료들의 정보 조회
        ArrayList<Product> materials = productMapper.getMaterialsByProductNo(productNo);

        // 원자재들의 현재 재고 조회
        ArrayList<Product> materialStocks = productMapper.getMaterialStock(productNo);

        // 원자재 재고를 Map으로 변환 (키: 원자재 번호, 값: 현재 재고)
        HashMap<Integer, Integer> stockMap = new HashMap<>();
        for (Product stock : materialStocks) {
            stockMap.put((int) stock.getProNo(), stock.getStock());
        }

        // 필요한 재료가 충분한지 확인
        for (Product material : materials) {
            int requiredAmount = material.getAmount() * quantity;

         // Map에서 key에 해당하는 값이 있으면 그걸 반환하고, 없으면 기본값(defaultValue)을 반환
            int currentStock = stockMap.getOrDefault(material.getProNo(), 0); // 재고 없으면 0으로 처리

            if (currentStock < requiredAmount) {
                return false; // 재료 부족
            }
        }

        // 제품 생산 (완제품 재고 증가)
        productMapper.increaseProductStock(productNo, quantity);

        // 원자재 사용 (원자재 재고 감소)
        productMapper.decreaseMaterialStock(productNo, quantity);

        return true;
    }


}
