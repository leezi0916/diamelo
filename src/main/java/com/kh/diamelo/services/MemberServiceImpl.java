package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    // 회원가입 - 아이디 중복 체크
    @Override
    public int idCheck(String userId) {
        return memberMapper.idCheck(userId);
    }

    // 회원가입
    @Override
    public int insertMember(UserInfo userInfo) {
        return memberMapper.insertMember(userInfo);
    }

    // 로그인
    @Override
    public UserInfo loginMember(String userId) {
        return memberMapper.loginMember(userId);
    }

    // 개인정보 변경
    @Override
    public int updateMember(UserInfo userInfo) {
        return memberMapper.updateMember(userInfo);
    }

    // 비밀번호 변경
    @Override
    public int updatePwd(String newPwd, String userId) {
        return memberMapper.upDatePwd(newPwd, userId);
    }

    // 회원 탈퇴
    @Override
    public int deleteMember(String userId) {
        return memberMapper.deleteMember(userId);
    }
}
