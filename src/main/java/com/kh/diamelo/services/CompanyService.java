package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.catalina.User;

import java.util.ArrayList;

public interface CompanyService {
    //거래관리 페이징을 위한 거래처 상태가 Y인 총 회사 수
    int selectCompanySuccessCount();

    //거래관리 페이지에 기업명, 대표자명, 연락처, 이메일을 테이블에서 찾아옴
    ArrayList<UserInfo> selectCompanyList(PageInfo pi);

    //거래관리 관리자용 페이지에서 모든 거래처의 총 수
    int selectCompanyReadyCount();

    //거래관리 관리자용 페이지에서 모든 거래처를 찾아옴
    ArrayList<UserInfo> selectAllList(PageInfo pi);

    //거래처 조건 검색 후 거래처 수
    int selectCompanyDetailCount(String companyName, String userName);

    //거래처 조건 검색
    ArrayList<UserInfo> selectCompanyDetailList(String companyName, String userName, PageInfo pi);

    //어드민 거래처 관리 페이지 거래처 수
    int selectAdminPageCompanyCount(String type, String companyName, String userName);

    //어드민 거래처 관리 페이지 조건 검색
    ArrayList<UserInfo> selectAdminPageDetailList(String type, String companyName, String userName, PageInfo pi);

    //거래처 관리자 페이지 거래처 승인
    int updateStatusCommit(UserInfo userInfo);

    //거래처 관리자 페이지 거래처 반려
    int updateStatusReturn(UserInfo userInfo);

    //거래처 관리자 페이지 거래처 상태 검색
    UserInfo selectCompanyStatus(UserInfo userInfo);
    
    //거래처 관리자 페이지 거래처 삭제
    int deleteCompany(UserInfo userInfo);
}
