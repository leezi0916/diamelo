package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.EmployeeService;
import com.kh.diamelo.utils.Template;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.util.ArrayList;


@RequiredArgsConstructor
@Controller
public class EmployeeController {
    private final EmployeeService employeeService;

    // 인사관리 페이지로 가기
    @GetMapping("employee.erp")
    public String employee() {
        return "erpPage/employeePage";
    }

    // 인사 관리자 페이지로 가기
    @GetMapping("empAdmin.erp")
    public String empAdmin() {
        return "erpPage/employeeAdminPage";
    }



    @GetMapping("empList.erp")
    public String selectUserInfoList(@RequestParam(defaultValue = "1") int epage, Model model,HttpSession session) {
        String svg = "/image/erpIcon/member.png";
        
        int UserCount = employeeService.selectUserInfoCount();
        PageInfo pi = new PageInfo(UserCount, epage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectUserInfoList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "인사 관리");
        return "erpPage/employeePage";
    }

    @GetMapping("empAdminList.erp")
    public String selectAdminList(@RequestParam(defaultValue = "1") int epage, Model model) {
        int UserCount = employeeService.selectAdminUserInfoCount();

        PageInfo pi = new PageInfo(UserCount, epage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectAdminList(pi);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeeAdminPage";
    }

    // 인사 상세 페이지로 가기
    @GetMapping("empDetail.erp")
    public String selectEmployeeDetail(@RequestParam(value = "uId") String userId, Model model) {

        UserInfo empDetail = employeeService.selectEmployeeDetail(userId);


        System.out.println("empDetail"+empDetail);


        model.addAttribute("e", empDetail);
        return "erpPage/employeeDetailPage";
    }

    @GetMapping("empSearch.erp")
    public String selectEmployeeSearch(@RequestParam(defaultValue = "1") int cpage, String userName, String jobCode, Model model) {
        int UserCount = employeeService.selectSearchUserInfoCount(userName, jobCode);
        System.out.println("UserCount"+UserCount);
        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectSearchUserInfoList(pi, userName, jobCode);

        System.out.println("pi"+pi);
        model.addAttribute("userName", userName);
        model.addAttribute("jobCode", jobCode);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeePage";
    }

    @GetMapping("empAdminSearch.erp")
    public String selectAdminSearch(@RequestParam(defaultValue = "1") int epage, String userId, String userName, Model model) {
        int UserCount = employeeService.selectAdminSearchUserInfoCount(userId, userName);
        System.out.println("cpage"+epage);
        PageInfo pi = new PageInfo(UserCount, epage, 10, 10);
        ArrayList<UserInfo> list = employeeService.selectAdminSearchUserInfoList(pi, userId, userName);

        model.addAttribute("userName", userName);
        model.addAttribute("userId", userId);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        return "erpPage/employeeAdminPage";
    }

    @PostMapping("empDetailSearch.erp")
    public String updateEmployeeDetailSearch(@ModelAttribute UserInfo userInfo, MultipartFile refile, HttpSession session, Model model) {
        int imgSearch = employeeService.employeeDetailImageSearch(userInfo);
        System.out.println("userInfo"+userInfo);
        int result = employeeService.updateEmployeeDetailSearch(userInfo);

        if (refile != null && !refile.getOriginalFilename().isEmpty()) {
            //기존 첨부파일 삭제
            if(userInfo.getOriginName() != null && !userInfo.getOriginName().equals("")){
                new File(session.getServletContext().getRealPath(userInfo.getOriginName())).delete();
            }
            String changeName = Template.saveFile(refile, session, "/resources/uploadFile/");
            userInfo.setChangeName("/resources/uploadFile/" + changeName);
            userInfo.setOriginName(refile.getOriginalFilename());

            System.out.println(userInfo);
            if(imgSearch==0){
                employeeService.employeeDetailImageInsert(userInfo);
            }else{
                employeeService.updateEmployeeImage(userInfo);
            }
        }
        if (result > 0) {
            session.setAttribute("alertMsg", "수정 성공");
            return "redirect:/empAdminList.erp";
        } else {
            model.addAttribute("errorMsg", "수정 실패");
            return "common/errorPage";
        }
    }

}