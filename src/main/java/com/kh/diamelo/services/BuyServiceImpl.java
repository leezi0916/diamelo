package com.kh.diamelo.services;


import com.kh.diamelo.domain.vo.InoutGroup;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.mappers.BuyMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
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
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return buyMapper.selectBuyList(rowBounds);
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
    public int selectGroupNo() {
        return buyMapper.selectGroupNo();
    }

    @Override
    public Product selectInOutHistory(int gNo) {
        return buyMapper.selectInOutHistory(gNo);
    }

    @Override
    public ArrayList<Product> selectMatDetailList(int gNo) {
        return buyMapper.selectMatDetailList(gNo);
    }

    @Override
    public int selectMatPrice(int proNo) {
        return buyMapper.selectMatPrice(proNo);
    }

    @Override
    public int insertInoutGroup(InoutGroup inoutGroup) {
        return buyMapper.insertInoutGroup(inoutGroup);
    }

    @Override
    public Product selectfilePath(int proNo) {
        return buyMapper.selectfilePath(proNo);
    }

    @Override
    public int insertBuySalesDetails(SalesDetails salesDetails) {
        return buyMapper.insertBuySalesDetails(salesDetails);
    }

    @Override
    public int selectProNo(String proName) {
        return buyMapper.selectProNo(proName);
    }

    @Override
    public int updateProductInventory(Product product) {
        return buyMapper.updateProductInventory(product);
    }

    @Override
    public int selectSearchCount(String Date, String tDate, String user) {

        return buyMapper.selectSearchCount(Date, tDate, user);
    }

    @Override
    public String selectUserId(String user) {
        return buyMapper.selectUserId(user);
    }

    @Override
    public ArrayList<SalesDetails> selectSearchList(PageInfo pi,String Date, String tDate, String user) {
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return buyMapper.selectSearchList(rowBounds, Date, tDate, user);

    }



}
