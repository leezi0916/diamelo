package com.kh.diamelo.mappers;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {

    int idCheck(@Param("userId") String userId);
}
