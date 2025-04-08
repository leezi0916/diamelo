package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.InoutGroup;
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

    int insertOrderDetails(Product product);

//    int selectMetNum(ArrayList<Product> product);

    String selectGroupNo(@Param("rNum") int rNum);

    Product selectInOutHistory(@Param("sNo") int sNo);

    ArrayList<Product> selectMatDetailList(@Param("sNo") int sNo);

    int selectMatPrice(@Param("proName") String proName);

    int insertInoutGroup(InoutGroup inoutGroup);

    Product selectfilePath(@Param("proName") String proName);

    int insertSalesDetails(SalesDetails salesDetails);
}
