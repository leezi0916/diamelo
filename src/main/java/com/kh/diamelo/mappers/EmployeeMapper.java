package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.User_Info;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface EmployeeMapper {

    int selectUserInfoCount();

    ArrayList<User_Info> selectUserInfoList(RowBounds rowBounds);

    int selectAdminUserInfoCount();

    ArrayList<User_Info> selectAdminList(RowBounds rowBounds);

    User_Info selectEmployeeDetail(@Param("userId")String userId);

    int selectSearchUserInfoCount(@Param("userName")String userName, @Param("jobCode")String jobCode);

    ArrayList<User_Info> selectSearchUserInfoList(RowBounds rowBounds, @Param("userName")String userName, @Param("jobCode")String jobCode );

    int selectAdminSearchUserInfoCount(@Param("userId")String userId, @Param("userName")String userName);

    ArrayList<User_Info> selectAdminSearchUserInfoList(RowBounds rowBounds, @Param("userId")String userId,@Param("userName")String UserName);

    int updateEmployeeDetailSearch(User_Info userInfo);

    int updateEmployeeImage(User_Info userInfo);

    int employeeDetailImageSearch(User_Info userInfo);

    int employeeDetailImageInsert(User_Info userInfo);

}
