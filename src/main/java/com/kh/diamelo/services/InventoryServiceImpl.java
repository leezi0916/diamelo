package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Attachment;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Recipe;
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
    public ArrayList<Product> selectMaterialList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return inventoryMapper.selectMaterialList(rowBounds);
    }

    @Override
    public int insertProduct(Product product) {
        return inventoryMapper.insertProduct(product);
    }

    @Override
    public int insertProductAttachment(Attachment attachment) {
        return inventoryMapper.insertProductAttachment(attachment);
    }

    @Override
    public int insertRecipeList(ArrayList<Recipe> recipeList) {
        return inventoryMapper.insertRecipeList(recipeList);
    }




    @Override
    public int insertMaterial(Product product) {
        return inventoryMapper.insertMaterial(product);
    }

    @Override
    public int insertMaterialAttachment(Attachment attachment) {
        return inventoryMapper.insertMaterialAttachment(attachment);
    }


}
