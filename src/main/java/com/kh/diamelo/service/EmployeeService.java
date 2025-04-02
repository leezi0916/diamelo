package com.kh.diamelo.service;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.User_Info;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

public interface EmployeeService {

    int selectUserInfoCount();

    ArrayList<User_Info> selectUserInfoList(PageInfo pi);

    int selectAdminUserInfoCount();

    ArrayList<User_Info> selectAdminList(PageInfo pi);

    User_Info selectEmployeeDetail(String userId);

    int selectSearchUserInfoCount(String userName, String jobCode);

    ArrayList<User_Info> selectSearchUserInfoList(PageInfo pi, String userName, String jobCode);

    int selectAdminSearchUserInfoCount(String userId, String userName);

    ArrayList<User_Info> selectAdminSearchUserInfoList(PageInfo pi, String userId, String userName);

    int updateEmployeeDetailSearch(User_Info userInfo);

    int updateEmployeeImage(User_Info userInfo);

    int employeeDetailImageSearch(User_Info userInfo);

    int employeeDetailImageInsert(User_Info userInfo);
}
