package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

    // 제품 생산 기능 추가
    @Transactional
    public boolean produceProduct(int productNo, int quantity) {
        // 1. 제품에 필요한 재료 정보 조회
        ArrayList<Product> materials = getMaterialsByProductNo(productNo);

        if (materials == null || materials.isEmpty()) {
            System.out.println("해당 제품의 재료 정보가 없습니다.");
            return false;
        }

        // 2. 재료 수량 확인 (부족하면 생산 불가)
        ArrayList<Product> materialStocks = productMapper.getMaterialStock(productNo);

        // 재료 개수와 재고 개수가 일치하는지 확인
        if (materialStocks.size() != materials.size()) {
            System.out.println("🚨 오류: 재료 개수와 재고 개수가 일치하지 않습니다.");
            return false;
        }

        for (int i = 0; i < materials.size(); i++) {
            Product material = materials.get(i);
            Product stockData = materialStocks.get(i);

            int requiredAmount = material.getStock() * quantity;
            int currentStock = stockData.getStock(); // Product 객체에서 재고 정보 가져오기

            if (currentStock < requiredAmount) {
                System.out.println("재료 부족: " + material.getProName() +
                        " (필요량: " + requiredAmount + ", 현재 재고: " + currentStock + ")");
                return false;
            }
        }

        // 3. 제품 생산 (재고 증가)
        productMapper.increaseProductStock(productNo, quantity);
        System.out.println("제품 생산 완료: " + productNo + ", 생산량: " + quantity);

        // 4. 사용한 재료 차감
        for (Product material : materials) {
            int usedAmount = material.getStock() * quantity;
            productMapper.decreaseMaterialStock(material.getProNo(), usedAmount);
            System.out.println("✔ DEBUG: material.getStock() = " + material.getStock());
            System.out.println("✔ DEBUG: quantity = " + quantity);
            System.out.println("✔ DEBUG: usedAmount = " + usedAmount);

            System.out.println("재료 차감 완료: " + material.getProName() + " (-" + usedAmount + ")");
        }

        return true;
    }
}
