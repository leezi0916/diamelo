package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

@Mapper
public interface BuyMapper {
    int selectBuyCount();

    ArrayList<SalesDetails> selectBuyList(PageInfo pi);

    ArrayList<Product> selectProduceBuyList();

    int insertOrderDetails(ArrayList<Product> product);

//    int selectMetNum(ArrayList<Product> product);

    int selectHistoryNo(@Param("rNum") int rNum);
}
