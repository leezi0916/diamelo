package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.InoutGroup;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface BuyMapper {
    int selectBuyCount();

    ArrayList<SalesDetails> selectBuyList(RowBounds rowBounds);

    ArrayList<Product> selectProduceBuyList();

    int insertOrderDetails(Product product);

//    int selectMetNum(ArrayList<Product> product);

    int selectGroupNo();

    Product selectInOutHistory(@Param("gNo") int gNo);

    ArrayList<Product> selectMatDetailList(@Param("sNo") int sNo);

    int selectMatPrice(@Param("proNo") int proNo);

    int insertInoutGroup(InoutGroup inoutGroup);

    Product selectfilePath(@Param("proNo") int proNo);

    int insertBuySalesDetails(SalesDetails salesDetails);

    int selectProNo(@Param("proName") String proName);

    int updateProductInventory(Product product);

    int selectSearchCount(@Param("startDate") String startDate,@Param("endDate") String endDate,@Param("user") String user);

    ArrayList<SalesDetails> selectSearchList(RowBounds rowBounds,@Param("startDate") String startDate,@Param("endDate") String endDate,@Param("user") String user);

    String selectUserId(@Param("user") String user);
}
