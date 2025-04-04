package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.List;

@Mapper
public interface ProductMapper {



    int selectProductCount();

    int selectMaterialCount();

    ArrayList<Product> selectProductList(RowBounds rowBounds);

    int insertIngrediant(Product product);




    /*
    int countByIsProduct(@Param("isProduct") String isProduct);

    List<Product> findByIsProduct(@Param("isProduct") String isProduct);
    */
}
