package com.kh.diamelo.services;


import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.mappers.ErpMainMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@Service
public class ErpMainServiceImpl implements ErpMainService {

    private final ErpMainMapper erpMainMapper;

    @Override
    public int selectTodaySales() {
        return erpMainMapper.selectTodaySales();
    }

    @Override
    public int countSalesStatus1() {
        return erpMainMapper.countSalesStatus1();
    }
    @Override
    public int countSalesStatus2() {
        return erpMainMapper.countSalesStatus2();
    }
    @Override
    public int countSalesStatus3() {
        return erpMainMapper.countSalesStatus3();
    }

    @Override
    public int countEmployee() {
        return erpMainMapper.countEmployee();
    }

    @Override
    public Product notEnoughProduct() {
        return erpMainMapper.notEnoughProduct();
    }

    @Override
    public int recentSalesSum() {
        return erpMainMapper.recentSalesSum();
    }

    @Override
    public ArrayList<HashMap<String, Object>> selectMonthlySales() {
        return erpMainMapper.selectMonthlySales();
    }

    @Override
    public UserInfo selectUserInfo(String userId) {
        return erpMainMapper.selectUserInfo(userId);
    }

    @Override
    public ArrayList<Board> selectBoardList1() {
        return erpMainMapper.selectBoardList1();
    }

    @Override
    public ArrayList<Board> selectBoardList2() {
        return erpMainMapper.selectBoardList2();
    }
}
