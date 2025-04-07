package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;

import java.util.ArrayList;

public interface BuyService {

    int selectBuyCount();

    ArrayList<SalesDetails> selectBuyList(PageInfo pi);

    ArrayList<Product> selectProduceBuyList();

    int insertOrderDetails(ArrayList<Product> product);

    int selectHistoryNo(int rNum);
}
