package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Attachment;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Recipe;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Mapper
public interface InventoryMapper {



    int selectProductCount();

    int selectMaterialCount();

    ArrayList<Product> selectProductList(RowBounds rowBounds);

    ArrayList<Product> selectMaterialList(RowBounds rowBounds);


    int insertProduct(Product product);

    int insertProductAttachment(Attachment attachment);

    int insertRecipe(int proNo, int matNo, String matName, int amount, int price);




    int insertMaterial(Product product);

    int insertMaterialAttachment(Attachment attachment);



    Product selectProduct(int proNo);

    Attachment selectProductAttachment(int proNo);

    ArrayList<Recipe> selectRecipeList(int proNo);

    int inventoryInsert(int proNo);

    int updateProduct(Product product);

    int updateProductAttachment(Attachment attachment);

    int deleteRecipeByProNo(int proNo);



    int deleteProduct(int proNo);


    Product getProductInfo(Integer proNo);

    ArrayList<Product> selectAllMaterials();

    int selectSearchProductCount(@Param("searchCategoryNo") int searchCategoryNo,
                                 @Param("proNo") int proNo,
                                 @Param("proName") String proName);

    ArrayList<Product> selectSearchProductList(@Param("pi") PageInfo pi,
                                                @Param("searchCategoryNo") int searchCategoryNo,
                                                @Param("proNo") int proNo,
                                                @Param("proName") String proName,
                                               RowBounds rowBounds);





    int selectSearchMaterialCount(@Param("proNo") int proNo,
                                  @Param("proName") String proName);

    ArrayList<Product> selectSearchMaterialList(@Param("pi") PageInfo pi,
                                                @Param("proNo") int proNo,
                                                @Param("proName") String proName,
                                                RowBounds rowBounds);
}
