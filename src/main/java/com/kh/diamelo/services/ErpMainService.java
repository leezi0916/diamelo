package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.UserInfo;

import java.util.ArrayList;
import java.util.HashMap;

public interface ErpMainService {
    //오늘의 매출
    int selectTodaySales();

    //판매 현황 조회 W
    int countSalesStatus1();
    //판매 현황 조회 Y
    int countSalesStatus2();
    //판매 현황 조회 N
    int countSalesStatus3();

    //직원 수 count
    int countEmployee();

    //가장 부족한 제품재고
    Product notEnoughProduct();

    //최근 3개월간 매출합
    int recentSalesSum();

    // 최근 3개월간 매출 (그래프화)
    ArrayList<HashMap<String, Object>> selectMonthlySales();



    //로그인된 회원의 사진,부서명,직급명 조회
    UserInfo selectUserInfo(String userId);

    //최신 게시판 검색
    ArrayList<Board> selectBoardList1();

    //최신 게시판 검색
    ArrayList<Board> selectBoardList2();
}
