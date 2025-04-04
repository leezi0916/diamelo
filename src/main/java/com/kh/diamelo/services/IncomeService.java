package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.SalesDetails;

import java.util.ArrayList;

public interface IncomeService {
    //매출이 총 몇개인지
    int selectIncomeCount();

    //매출 개수를 가지고 리스트 보여주기
    ArrayList<SalesDetails> selectIncomeList(PageInfo pi);
}
