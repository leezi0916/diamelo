package com.kh.diamelo.services;

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
}
