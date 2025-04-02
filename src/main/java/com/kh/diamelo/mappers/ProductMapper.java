package com.kh.diamelo.mappers;


import com.kh.diamelo.domain.vo.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface ProductMapper {

    ArrayList<Product> getProductList();

    String getProductImage(int productNo);

    ArrayList<Product> getMaterialsByProductNo(int productNo);
}
