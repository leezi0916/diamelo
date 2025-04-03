package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.UserInfo;

public interface MemberService {
    int idCheck(String userId);

    int insertMember(UserInfo userInfo);
}
