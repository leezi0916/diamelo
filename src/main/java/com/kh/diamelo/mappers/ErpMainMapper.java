package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.HashMap;

@Mapper
public interface ErpMainMapper {
    //오늘의 매출
    int selectTodaySales();

    //판매 현황 조회 w
    int countSalesStatus1();
    //판매 현황 조회 y
    int countSalesStatus2();
    //판매 현황 조회 n
    int countSalesStatus3();

    //직원 수 count
    int countEmployee();

    //부족한 제품재고
    Product notEnoughProduct();


    //최근 3개월간 매출합
    int recentSalesSum();

    //최근 3개월간 매출그래프
    ArrayList<HashMap<String,Object>>selectMonthlySales();


    //로그인된 회원의 사진,부서명,직급명
    UserInfo selectUserInfo(String userId);

    //최신 공지사항 게시판 검색
    ArrayList<Board> selectBoardList1();

    //최신 문의사항 게시판 검색
    ArrayList<Board> selectBoardList2();
}
