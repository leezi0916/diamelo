package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.Sales_Details;

import java.util.ArrayList;

public interface BuyService {

    int selectBuyCount();

    ArrayList<Sales_Details> selectBuyList(PageInfo pi);

    ArrayList<Product> selectProduceBuyList(int salNo);


}
