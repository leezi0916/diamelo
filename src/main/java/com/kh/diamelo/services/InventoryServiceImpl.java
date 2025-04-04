package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Attachment;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.mappers.InventoryMapper;
import com.kh.diamelo.mappers.ProductMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.ArrayList;
import java.util.List;


@RequiredArgsConstructor
@Service
public class InventoryServiceImpl implements InventoryService {

    private final InventoryMapper inventoryMapper;

    /*
    @Override
    public int countProductsByType(String isProduct) {
        return productMapper.countByIsProduct(isProduct);
    }

    @Override
    public List<Product> getProductsByType(String isProduct) {
        return productMapper.findByIsProduct(isProduct);
    }
    */


    //제품 갯수
    @Override
    public int selectProductCount() {
        return inventoryMapper.selectProductCount();
    }

    //재료 갯수
    @Override
    public int selectMaterialCount() {
        return inventoryMapper.selectMaterialCount();
    }

    //제품 리스트
    @Override
    public ArrayList<Product> selectProductList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return inventoryMapper.selectProductList(rowBounds);
    }

    @Override
    public int insertIngrediant(Product product) {
        return inventoryMapper.insertIngrediant(product);
    }


}
