package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Sales_Details;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;

@Mapper
public interface BuyMapper {
    int selectBuyCount();

    ArrayList<Sales_Details> selectBuyList(PageInfo pi);

    ArrayList<Product> selectProduceBuyList(int salNo);
}
