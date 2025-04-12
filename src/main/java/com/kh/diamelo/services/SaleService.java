package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.*;

import java.util.ArrayList;
import java.util.Date;

public interface SaleService {
    int salesListCount();

    ArrayList<InoutGroup> selectSalesList(PageInfo pi);

    ArrayList<Product> selectSaleDetailList(int sNo);

    String selectInoutGroup(int sNo);

    String selectGroupStatus(int sNo);

    int updateStatus(int sNo);

    int updateStatusN(int sNo);

    int updateProductPlus(Product product);

    int updateProductMinus(Product product);

    String selectUserId(int sNo);

    int insertSalesDetails(SalesDetails salesDetails);

    int selectSearchCount(String company, String startDate, String endDate);

    ArrayList<InoutGroup> selectSearchList(PageInfo pi,String company, String startDate, String endDate);

    String selectGroupNo(int sNo);
}
