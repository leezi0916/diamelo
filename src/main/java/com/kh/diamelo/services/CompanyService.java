package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;

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
}
