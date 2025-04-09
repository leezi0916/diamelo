package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.InoutGroup;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;

import java.util.ArrayList;

public interface BuyService {

    int selectBuyCount();

    ArrayList<SalesDetails> selectBuyList(PageInfo pi);

    ArrayList<Product> selectProduceBuyList();

    int insertOrderDetails(Product product);

    String selectGroupNo(int rNum);

    Product selectInOutHistory(int gNo);

    ArrayList<Product> selectMatDetailList(int gNo);

    int selectMatPrice(String proName);

    int insertInoutGroup(InoutGroup inoutGroup);

    Product selectfilePath(String proName);

    int insertSalesDetails(SalesDetails salesDetails);

    int selectProNo(String proName);

    int updateProductInventory(Product product);

    int selectSearchCount(String Date, String tDate, String user);

    String selectUserId(String user);

    ArrayList<SalesDetails> selectSearchList(PageInfo pi,String Date, String tDate, String user);
}
