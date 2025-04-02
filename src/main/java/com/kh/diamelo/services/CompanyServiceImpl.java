package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.mappers.CompanyMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;
import java.util.ArrayList;

@Service
@RequiredArgsConstructor

public class CompanyServiceImpl implements CompanyService {

    private final CompanyMapper companyMapper;

    //거래관리 페이징을 위한 거래처 상태가 Y인 총 회사 수
    @Override
    public int selectCompanySuccessCount() {
        return companyMapper.selectCompanySuccessCount();
    }

    //거래관리 페이지에 기업명, 대표자명, 연락처, 이메일을 테이블에서 찾아옴
    @Override
    public ArrayList<UserInfo> selectCompanyList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return companyMapper.selectCompanyList(rowBounds);
    }

    //거래관리 관리자용 페이지에서 모든 거래처의 총 수
    @Override
    public int selectCompanyReadyCount() {
        return companyMapper.selectCompanyReadyCount();
    }

    //거래관리 관리자용 페이지에서 모든 거래처를 찾아옴
    @Override
    public ArrayList<UserInfo> selectAllList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getPageLimit());
        return companyMapper.selectAllList(rowBounds);
    }
}
