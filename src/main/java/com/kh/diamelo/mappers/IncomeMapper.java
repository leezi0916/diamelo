package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.SalesDetails;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface IncomeMapper {
    // 매출 개수 몇개인지
    int selectIncomeCount();
    // 매출 목록 조회
    ArrayList<SalesDetails> selectIncomeList(RowBounds rowBounds);
}
