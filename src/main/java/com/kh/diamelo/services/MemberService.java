package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.UserInfo;

public interface MemberService {
    // 회원가입 - 아이디 중복 체크
    int idCheck(String userId);

    // 회원가입
    int insertMember(UserInfo userInfo);

    // 로그인
    UserInfo loginMember(String userId);

    // 개인정보 변경
    int updateMember(UserInfo userInfo);

    // 비밀번호 변경
    int updatePwd(String newPwd, String userId);

    // 회원 탈퇴
    int deleteMember(String userId);
}
