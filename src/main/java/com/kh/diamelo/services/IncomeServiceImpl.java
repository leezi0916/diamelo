package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.mappers.IncomeMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class IncomeServiceImpl implements IncomeService {

    private final IncomeMapper incomeMapper;

    @Override
    public int selectIncomeCount() {

        return incomeMapper.selectIncomeCount();
    }

    @Override
    public ArrayList<SalesDetails> selectIncomeList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getBoardLimit());
        return incomeMapper.selectIncomeList(rowBounds);
    }
}
