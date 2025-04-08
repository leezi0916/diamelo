package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface CompanyMapper {
    //거래관리 페이징을 위한 거래처 상태가 Y인 총 회사 수
    int selectCompanySuccessCount();

    //거래관리 페이지에 기업명, 대표자명, 연락처, 이메일을 테이블에서 찾아옴
    ArrayList<UserInfo> selectCompanyList(RowBounds rowBounds);

    //거래관리 관리자용 페이지에서 모든 거래처의 총 수
    int selectCompanyReadyCount();

    //거래관리 관리자용 페이지에서 모든 거래처를 찾아옴
    ArrayList<UserInfo> selectAllList(RowBounds rowBounds);

    //거래처 조건 검색 후 거래처 수
    int selectCompanyDetailCount(@Param("companyName") String companyName,
                                 @Param("userName") String userName);

    //거래처 조건 검색
    ArrayList<UserInfo> selectCompanyDetailList(@Param("companyName") String companyName,
                                                @Param("userName") String userName, RowBounds rowBounds);

    //어드민 거래처 관리 페이지 거래처 수
    int selectAdminPageCompanyCount(@Param("type")String type, @Param("companyName") String companyName,
                                    @Param("userName") String userName);

    //어드민 거래처 관리 페이지 조건 검색
    ArrayList<UserInfo> selectAdminPageDetailList(@Param("type")String type, @Param("companyName") String companyName,
                                                  @Param("userName") String userName, RowBounds rowBounds);

    //거래처 관리자 페이지 거래처 승인
    int updateStatusCommit(UserInfo userInfo);

    //거래처 관리자 페이지 거래처 반려
    int updateStatusReturn(UserInfo userInfo);
    //거래처 관리자 페이지 거래처 상태 검색
    UserInfo selectCompanyStatus(UserInfo userInfo);
    
    //거래처 관리자 페이지 거래처 삭제
    int deleteCompany(UserInfo userInfo);
}
