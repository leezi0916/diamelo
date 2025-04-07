package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Attachment;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Recipe;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface InventoryMapper {



    int selectProductCount();

    int selectMaterialCount();

    ArrayList<Product> selectProductList(RowBounds rowBounds);

    ArrayList<Product> selectMaterialList(RowBounds rowBounds);


    int insertProduct(Product product);

    int insertProductAttachment(Attachment attachment);

    int insertRecipeList(@Param("recipeList") ArrayList<Recipe> recipeList);


    int insertMaterial(Product product);

    int insertMaterialAttachment(Attachment attachment);




    /*
    int countByIsProduct(@Param("isProduct") String isProduct);

    List<Product> findByIsProduct(@Param("isProduct") String isProduct);
    */

}
