package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.mappers.MemberMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@RequiredArgsConstructor
@Service
public class MemberServiceImpl implements MemberService {

    private final MemberMapper memberMapper;

    @Override
    public int idCheck(String userId) {
        return memberMapper.idCheck(userId);
    }

    @Override
    public int insertMember(UserInfo userInfo) {
        return memberMapper.insertMember(userInfo);
    }
}
