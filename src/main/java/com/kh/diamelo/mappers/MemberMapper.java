package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

@Mapper
public interface MemberMapper {
    // 회원가입 - 아이디 중복 체크
    int idCheck(@Param("userId") String userId);

    // 회원가입
    int insertMember(UserInfo userInfo);

    // 로그인
    UserInfo loginMember(@Param("userId") String userId);

    // 개인정보 변경
    int upDateMember(UserInfo userInfo);
}
