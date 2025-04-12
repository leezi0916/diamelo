package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface EmployeeMapper {

    int selectUserInfoCount();

    ArrayList<UserInfo> selectUserInfoList(RowBounds rowBounds);

    int selectAdminUserInfoCount();

    ArrayList<UserInfo> selectAdminList(RowBounds rowBounds);

    UserInfo selectEmployeeDetail(@Param("userId")String userId);

    int selectSearchUserInfoCount(@Param("userName")String userName, @Param("jobCode")String jobCode);

    ArrayList<UserInfo> selectSearchUserInfoList(RowBounds rowBounds, @Param("userName")String userName, @Param("jobCode")String jobCode );

    int selectAdminSearchUserInfoCount(@Param("userId")String userId, @Param("userName")String userName);

    ArrayList<UserInfo> selectAdminSearchUserInfoList(RowBounds rowBounds, @Param("userId")String userId,@Param("userName")String UserName);

    int updateEmployeeDetailSearch(UserInfo userInfo);

    int updateEmployeeImage(UserInfo userInfo);

    int employeeDetailImageSearch(UserInfo userInfo);

    int employeeDetailImageInsert(UserInfo userInfo);

    int empStatusDelete(String userId);

    UserInfo empStatusSearch(String userId);

    int empUserDelete(String userId);

    int empStatusUpdate(String userId);
}
