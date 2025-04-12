package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Attachment;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Recipe;
import com.kh.diamelo.mappers.InventoryMapper;
import com.kh.diamelo.mappers.ProductMapper;
import com.kh.diamelo.utils.Template;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;


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
    public int selectSearchProductCount(int searchCategoryNo, int proNo, String proName) {
        return inventoryMapper.selectSearchProductCount(searchCategoryNo, proNo , proName);
    }

    @Override
    public ArrayList<Product> selectSearchProductList(PageInfo pi, int searchCategoryNo, int proNo, String proName) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return inventoryMapper.selectSearchProductList(pi, searchCategoryNo, proNo, proName,rowBounds);
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
    public int insertRecipe(int proNo, int matNo, String matName, int amount, int matPrice) {
        return inventoryMapper.insertRecipe(proNo, matNo, matName, amount, matPrice);
    }





    @Override
    public int insertMaterial(Product product) {
        return inventoryMapper.insertMaterial(product);
    }

    @Override
    public int insertMaterialAttachment(Attachment attachment) {
        return inventoryMapper.insertMaterialAttachment(attachment);
    }

    @Override
    public int inventoryInsert(int proNo) {
        return inventoryMapper.inventoryInsert(proNo);
    }


    @Override
    public Product selectProduct(int proNo) {
        return inventoryMapper.selectProduct(proNo);
    }

    @Override
    public Attachment selectProductAttachment(int proNo) {
        return inventoryMapper.selectProductAttachment(proNo);
    }

    @Override
    public ArrayList<Recipe> selectRecipeList(int proNo) {
        return inventoryMapper.selectRecipeList(proNo);
    }



    @Override
    public int updateProduct(Product product) {
        return inventoryMapper.updateProduct(product);
    }

    @Override
    public int updateProductAttachment(Attachment attachment) {
        return inventoryMapper.updateProductAttachment(attachment);
    }

    @Override
    public int deleteRecipeByProNo(int proNo) {
        return inventoryMapper.deleteRecipeByProNo(proNo);
    }

    @Override
    public int deleteProduct(int proNo) {
        return inventoryMapper.deleteProduct(proNo);
    }



    @Override
    public Product getProductInfo(Integer proNo) {
        return inventoryMapper.getProductInfo(proNo);
    }

    @Override
    public ArrayList<Product> selectAllMaterials() {
        return inventoryMapper.selectAllMaterials();
    }


    @Override
    public int selectSearchMaterialCount(int proNo, String proName) {
        return inventoryMapper.selectSearchMaterialCount(proNo , proName);
    }

    @Override
    public ArrayList<Product> selectSearchMaterialList(PageInfo pi, int mSearchCount, int proNo, String proName) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return inventoryMapper.selectSearchMaterialList(pi, proNo, proName, rowBounds);
    }
}
