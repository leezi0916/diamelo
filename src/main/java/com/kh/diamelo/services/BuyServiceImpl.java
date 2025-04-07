package com.kh.diamelo.services;


import com.kh.diamelo.domain.vo.InoutGroup;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.mappers.BuyMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BuyServiceImpl implements BuyService {
    private final BuyMapper buyMapper;

    @Override
    public int selectBuyCount() {
        return buyMapper.selectBuyCount();
    }

    @Override
    public ArrayList<SalesDetails> selectBuyList(PageInfo pi) {
        return buyMapper.selectBuyList(pi);
    }

    @Override
    public ArrayList<Product> selectProduceBuyList() {
        return buyMapper.selectProduceBuyList();
    }

    @Override
    public int insertOrderDetails(Product product) {
//        int proName =  buyMapper.selectMetNum(product);


        return buyMapper.insertOrderDetails(product);
    }

    @Override
    public String selectGroupNo(int rNum) {
        return buyMapper.selectGroupNo(rNum);
    }

    @Override
    public Product selectInOutHistory(int sNo) {
        return buyMapper.selectInOutHistory(sNo);
    }

    @Override
    public ArrayList<Product> selectMatDetailList(int sNo) {
        return buyMapper.selectMatDetailList(sNo);
    }

    @Override
    public int selectMatPrice(String proName) {
        return buyMapper.selectMatPrice(proName);
    }

    @Override
    public int insertInoutGroup(InoutGroup inoutGroup) {
        return buyMapper.insertInoutGroup(inoutGroup);
    }

    @Override
    public Product selectfilePath(String proName) {
        return buyMapper.selectfilePath(proName);
    }

    @Override
    public int insertSalesDetails(SalesDetails salesDetails) {
        return buyMapper.insertSalesDetails(salesDetails);
    }


}
