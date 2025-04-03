package com.kh.diamelo.service;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.User_Info;
import com.kh.diamelo.mappers.EmployeeMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor //이게 Autowired 역할을 해줌
@Service
public class EmployeeServiceImpl implements   EmployeeService{
    private final EmployeeMapper employeeMapper;


    @Override
    public int selectUserInfoCount() {
        return employeeMapper.selectUserInfoCount();
    }

    @Override
    public ArrayList<User_Info> selectUserInfoList(PageInfo pi){
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());

        return employeeMapper.selectUserInfoList(rowBounds);
    }

    @Override
    public int selectAdminUserInfoCount() {
        return employeeMapper.selectAdminUserInfoCount();
    }

    @Override
    public ArrayList<User_Info> selectAdminList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return employeeMapper.selectAdminList(rowBounds);
    }

    @Override
    public User_Info selectEmployeeDetail(String userId) {

        return employeeMapper.selectEmployeeDetail(userId);
    }

    @Override
    public int selectSearchUserInfoCount(String userName, String jobCode) {
        return employeeMapper.selectSearchUserInfoCount(userName, jobCode);
    }

    @Override
    public ArrayList<User_Info> selectSearchUserInfoList(PageInfo pi, String userName, String jobCode) {
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return employeeMapper.selectSearchUserInfoList(rowBounds, userName, jobCode);
    }

    @Override
    public int selectAdminSearchUserInfoCount(String userId, String userName) {
        return employeeMapper.selectAdminSearchUserInfoCount(userId, userName);
    }

    @Override
    public ArrayList<User_Info> selectAdminSearchUserInfoList(PageInfo pi, String userId, String userName) {
        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
        return employeeMapper.selectAdminSearchUserInfoList(rowBounds, userId, userName);
    }



    @Override
    public int updateEmployeeDetailSearch(User_Info userInfo) {
        return employeeMapper.updateEmployeeDetailSearch(userInfo);
    }

    @Override
    public int updateEmployeeImage(User_Info userInfo) {
        return employeeMapper.updateEmployeeImage(userInfo);
    }

    @Override
    public int employeeDetailImageSearch(User_Info userInfo) {
        return employeeMapper.employeeDetailImageSearch(userInfo);
    }

    @Override
    public int employeeDetailImageInsert(User_Info userInfo) {
        return employeeMapper.employeeDetailImageInsert(userInfo);
    }


}


//    @Override
//    public int selectBoardCount() {
//        return boardMapper.selectBoardCount();
//    }

//
//
//    @Override
//    public ArrayList<User_Info> empList() {
//
//
//        ArrayList<User_Info> empList = new ArrayList<>();
//
//        int offset = (pi.getCurrentPage() - 1)*pi.getBoardLimit();
//        RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
//        empList = employeeMapper();
//        return null;
//    }
//}
