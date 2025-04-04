package com.kh.diamelo.services;


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


}
