package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.*;
import com.kh.diamelo.mappers.SaleMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class SaleServiceImpl implements SaleService {
    private final SaleMapper saleMapper;

    @Override
    public int salesListCount() {
        return saleMapper.salesListCount();
    }

    @Override
    public ArrayList<InoutGroup> selectSalesList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return saleMapper.selectSalesList(rowBounds);
    }

    @Override
    public ArrayList<Product> selectSaleDetailList(int sNo) {
        return saleMapper.selectSaleDetailList(sNo);
    }

    @Override
    public String selectInoutGroup(int sNo) {
        return saleMapper.selectInoutGroup(sNo);
    }

    @Override
    public String selectGroupStatus(int sNo) {
        return saleMapper.selectGroupStatus(sNo);
    }

    @Override
    public int updateStatus(int sNo) {
        return saleMapper.updateStatus(sNo);
    }

    @Override
    public int updateStatusN(int sNo) {
        return saleMapper.updateStatusN(sNo);
    }

    @Override
    public int updateProduct(Product product) {
        return saleMapper.updateProduct(product);
    }

    @Override
    public String selectUserId(int sNo) {
        return saleMapper.selectUserId(sNo);
    }

    @Override
    public int insertSalesDetails(SalesDetails salesDetails) {
        return saleMapper.insertSalesDetails(salesDetails);
    }
}
