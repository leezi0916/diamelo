package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.*;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;

import java.util.ArrayList;

public interface InventoryService {



        int selectProductCount();
        int selectMaterialCount();

        ArrayList<Product> selectProductList(PageInfo pi);
        ArrayList<Product> selectMaterialList(PageInfo pi);

        int selectSearchProductCount(int searchCategoryNo, int proNo, String proName);
        ArrayList<Product> selectSearchProductList(PageInfo pi ,int searchCategoryNo, int proNo, String proName);


        int insertProduct(Product product);
        int insertProductAttachment(Attachment attachment);
        int insertRecipe(int proNo, int matNo, String matName, int amount, int matPrice);



        int insertMaterial(Product product);
        int insertMaterialAttachment(Attachment attachment);

        int inventoryInsert(int proNo);


        Product selectProduct(int proNo);
        Attachment selectProductAttachment(int proNo);


        ArrayList<Recipe> selectRecipeList(int proNo);


        int updateProduct(Product product);
        int updateProductAttachment(Attachment attachment);


        int deleteRecipeByProNo(int proNo);

        int deleteProduct(int proNo);


        Product getProductInfo(Integer proNo);

        ArrayList<Product> selectAllMaterials();


        int selectSearchMaterialCount(int proNo, String proName);
        ArrayList<Product> selectSearchMaterialList(PageInfo pi, int mSearchCount, int proNo, String proName);








    /*
        int countProductsByType(String isProduct);
        public List<Product> getProductsByType(String isProduct);
     */
}
