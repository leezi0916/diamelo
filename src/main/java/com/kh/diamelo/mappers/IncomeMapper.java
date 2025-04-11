package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.SalesDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface IncomeMapper {
    // 매출 개수 몇개인지
    int selectIncomeCount();
    // 매출 목록 조회
    ArrayList<SalesDetails> selectIncomeList(RowBounds rowBounds);

    // 조건에 맞는 매출 개수
    int selectSerachIncomeCount(@Param("type") String type,
                                @Param("startDate") String startDate,
                                @Param("endDate") String endDate,
                                @Param("company") String company);

    // 조건에 맞는 매출 리스트 보여주기
    ArrayList<SalesDetails> selectSearchIncomeList(RowBounds rowBounds,
                                                   @Param("type") String type,
                                                   @Param("startDate") String startDate,
                                                   @Param("endDate") String endDate,
                                                   @Param("company") String company);


    // 조건에 맞는 매출합 보여주기
    int searchIncomeSum(  @Param("type") String type,
                          @Param("startDate") String startDate,
                          @Param("endDate") String endDate,
                          @Param("company") String company);

    //gno의 담긴 매출 상세보기
    ArrayList<SalesDetails> incomeDetail(int gno);
    
    //총 소득
    int selectIncomeInSales();
    //총 지출
    int selectIncomeOutSales();

    //검색 조건 총 소득
    int selectIncomeInSalesDetail(@Param("type") String type,
                                  @Param("startDate") String startDate,
                                  @Param("endDate") String endDate,
                                  @Param("company") String company);
    //검색 조건 총 지출
    int selectIncomeOutSalesDetail(@Param("type") String type,
                                   @Param("startDate") String startDate,
                                   @Param("endDate") String endDate,
                                   @Param("company") String company);


}
