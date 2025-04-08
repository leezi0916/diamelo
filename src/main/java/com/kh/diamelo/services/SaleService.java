package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.*;

import java.util.ArrayList;

public interface SaleService {
    int salesListCount();

    ArrayList<InoutGroup> selectSalesList(PageInfo pi);

    ArrayList<Product> selectSaleDetailList(int sNo);

    String selectInoutGroup(int sNo);

    String selectGroupStatus(int sNo);

    int updateStatus(int sNo);

    int updateStatusN(int sNo);

    int updateProduct(Product product);

    String selectUserId(int sNo);

    int insertSalesDetails(SalesDetails salesDetails);
}
