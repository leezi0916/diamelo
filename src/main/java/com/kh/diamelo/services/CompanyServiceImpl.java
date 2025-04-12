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

    //거래처 조건 검색 후 거래처 수
    @Override
    public int selectCompanyDetailCount(String companyName, String userName) {
        return companyMapper.selectCompanyDetailCount(companyName, userName);
    }

    //거래처 조건 검색
    @Override
    public ArrayList<UserInfo> selectCompanyDetailList(String companyName, String userName, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return companyMapper.selectCompanyDetailList(companyName, userName, rowBounds);
    }

    //어드민 거래처 관리 페이지 거래처 수
    @Override
    public int selectAdminPageCompanyCount(String type, String companyName, String userName) {
        return companyMapper.selectAdminPageCompanyCount(type, companyName, userName);
    }

    //어드민 거래처 관리 페이지 조건 검색
    @Override
    public ArrayList<UserInfo> selectAdminPageDetailList(String type, String companyName, String userName, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return companyMapper.selectAdminPageDetailList(type, companyName, userName, rowBounds);
    }

    //거래처 관리자 페이지 거래처 승인
    @Override
    public int updateStatusCommit(UserInfo userInfo) {
        return companyMapper.updateStatusCommit(userInfo);
    }

    //거래처 관리자 페이지 거래처 반려
    @Override
    public int updateStatusReturn(UserInfo userInfo) {
        return companyMapper.updateStatusReturn(userInfo);
    }

    //거래처 관리자 페이지 거래처 상태 검색
    @Override
    public UserInfo selectCompanyStatus(UserInfo userInfo) {
        return companyMapper.selectCompanyStatus(userInfo);
    }

    //거래처 관리자 페이지 거래처 삭제
    @Override
    public int deleteCompany(UserInfo userInfo) {
        return companyMapper.deleteCompany(userInfo);
    }
}
