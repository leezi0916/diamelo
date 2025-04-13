package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;

import java.util.ArrayList;

public interface EmployeeService {

    int selectUserInfoCount();

    ArrayList<UserInfo> selectUserInfoList(PageInfo pi);

    int selectAdminUserInfoCount();

    ArrayList<UserInfo> selectAdminList(PageInfo pi);

    UserInfo selectEmployeeDetail(String userId);

    int selectSearchUserInfoCount(String userName, String jobCode);

    ArrayList<UserInfo> selectSearchUserInfoList(PageInfo pi, String userName, String jobCode);

    int selectAdminSearchUserInfoCount(String userId, String userName);

    ArrayList<UserInfo> selectAdminSearchUserInfoList(PageInfo pi, String userId, String userName);

    int updateEmployeeDetailSearch(UserInfo userInfo);

    int updateEmployeeImage(UserInfo userInfo);

    int employeeDetailImageSearch(UserInfo userInfo);

    int employeeDetailImageInsert(UserInfo userInfo);

    int empStatusDelete(String userId);

    UserInfo empStatusSearch(String userId);

    int empUserDelete(String userId);

    int empStatusUpdate(String userId);
}
