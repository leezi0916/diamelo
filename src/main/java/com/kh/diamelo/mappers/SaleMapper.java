package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.InoutGroup;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Sales;
import com.kh.diamelo.domain.vo.SalesDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;
import java.util.Date;

@Mapper
public interface SaleMapper {
    int salesListCount();

    ArrayList<InoutGroup> selectSalesList(RowBounds rowBounds);

    ArrayList<Product> selectSaleDetailList(@Param("sNo") int sNo);

    String selectInoutGroup(@Param("sNo") int sNo);

    String selectGroupStatus(@Param("sNo") int sNo);

    String selectGroupNo(@Param("sNo") int sNo);

    int updateStatus(@Param("sNo") int sNo);

    int updateStatusN(@Param("sNo") int sNo);

    int updateProductPlus(Product product);

    int updateProductMinus(Product product);

    String selectUserId(@Param("sNo") int sNo);

    int insertSalesDetails(SalesDetails salesDetails);

    int selectSearchCount(@Param("company") String company,String startDate, String endDate);

    ArrayList<InoutGroup> selectSearchList(RowBounds rowBounds,@Param("company") String company, String startDate, String endDate);
}
