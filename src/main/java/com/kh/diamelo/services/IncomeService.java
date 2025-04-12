package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.SalesDetails;

import java.util.ArrayList;

public interface IncomeService {
    //매출이 총 몇개인지
    int selectIncomeCount();

    //매출 개수를 가지고 리스트 보여주기
    ArrayList<SalesDetails> selectIncomeList(PageInfo pi);


    //조건에 맞는 매출 개수 검색
    int selectSerachIncomeCount(String type, String startDate, String endDate, String company);

    //조건에 맞는 매출 리스트 보여주기
    ArrayList<SalesDetails> selectSearchIncomeList(PageInfo pi, String type, String startDate, String endDate, String company);


    //조건에 맞는 매출 리스트 보여주기
    int searchIncomeSum(String type, String startDate, String endDate, String company);

    //gno에 해당하는 상세보여주기
    ArrayList<SalesDetails> incomeDetail(int gno);

    //총 매출 가져오기
    int selectIncomeAllSales();

    //조건에 맞는 매출 총이익 구하기
    int selectIncomeAllSalesDetails(String type, String startDate, String endDate, String company);
}
