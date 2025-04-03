package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    int idCheck(@Param("userId") String userId);

    int insertMember(UserInfo userInfo);
}
