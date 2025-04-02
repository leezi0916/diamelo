package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.User_Info;
import com.kh.diamelo.service.EmployeeService;
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


    //인사 상세 페이지에서 수정하기 눌렀을 때의 redirect
    @PostMapping("empAdmin.erp")
    public String empAdminPost() {
        return null;
    }

    @GetMapping("empList.erp")
    public String selectUserInfoList(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int UserCount = employeeService.selectUserInfoCount();

        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);
        ArrayList<User_Info> list = employeeService.selectUserInfoList(pi);
        System.out.println(list);
        System.out.println(UserCount);
        System.out.println(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/employeePage";
    }

    @GetMapping("empAdminList.erp")
    public String selectAdminList(@RequestParam(defaultValue = "1") int cpage, Model model) {
        int UserCount = employeeService.selectAdminUserInfoCount();
        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);

        ArrayList<User_Info> list = employeeService.selectAdminList(pi);

        System.out.println("empAdminList" + list);
        System.out.println("empAdminList" + UserCount);
        System.out.println("empAdminList" + pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/employeeAdminPage";
    }

    // 인사 상세 페이지로 가기
    @GetMapping("empDetail.erp")
    public String selectEmployeeDetail(@RequestParam(value = "uId") String userId, Model model) {
        System.out.println(userId);
        User_Info empDetail = employeeService.selectEmployeeDetail(userId);
        System.out.println("empDetail.erp" + empDetail);

        model.addAttribute("e", empDetail);
        return "erpPage/employeeDetailPage";
    }

    @GetMapping("empSearch.erp")
    public String selectEmployeeSearch(@RequestParam(defaultValue = "1") int cpage, String userName, String jobCode, Model model) {
        int UserCount = employeeService.selectSearchUserInfoCount(userName, jobCode);
        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);
        ArrayList<User_Info> list = employeeService.selectSearchUserInfoList(pi, userName, jobCode);
        System.out.println("empsearch.erp" + list);
        model.addAttribute("slist", list);
        model.addAttribute("spi", pi);
        return "erpPage/employeePage";
    }

    @GetMapping("empAdminSearch.erp")
    public String selectAdminSearch(@RequestParam(defaultValue = "1") int cpage, String userId, String userName, Model model) {
        int UserCount = employeeService.selectAdminSearchUserInfoCount(userId, userName);

        PageInfo pi = new PageInfo(UserCount, cpage, 10, 10);

        ArrayList<User_Info> list = employeeService.selectAdminSearchUserInfoList(pi, userId, userName);

        System.out.println("empAdminSearch.erp" + list);
        model.addAttribute("slist", list);
        model.addAttribute("spi", pi);

        return "erpPage/employeeAdminPage";
    }


    @PostMapping("empDetailSearch.erp")
    public String updateEmployeeDetailSearch(@ModelAttribute User_Info userInfo, MultipartFile refile, HttpSession session, Model model) {

        int imgSearch = employeeService.employeeDetailImageSearch(userInfo);


        if (refile != null && !refile.getOriginalFilename().equals("")) {
            // 기존 파일 삭제
            if (userInfo.getOriginName() != null && !userInfo.getOriginName().equals("")) {
                new File(session.getServletContext().getRealPath(userInfo.getChangeName())).delete();
            }


        if(!refile.getOriginalFilename().equals("")){
        if (userInfo.getOriginName() != null && !userInfo.getOriginName().equals("")) {
            new File(session.getServletContext().getRealPath(userInfo.getOriginName())).delete();



        if (!refile.getOriginalFilename().equals("")) {
            //기존 첨부파일이 존재하지 않을 때 새롭게 insert용
            if (userInfo.getOriginName() == null) {
                String changeName = Template.saveFile(refile, session, "/resources/image/employeeImage/");
                userInfo.setChangeName("/resources/image/employeeImage/" + changeName);
                userInfo.setOriginName(refile.getOriginalFilename());
                userInfo.setFilePath("/resources/image/employeeImage/");
                int imgInsert = employeeService.employeeDetailImageInsert(userInfo);
            } else if (userInfo.getOriginName() != null && !userInfo.getOriginName().equals("")) {
                new File(session.getServletContext().getRealPath(userInfo.getOriginName())).delete();
            }else {
                String changeName = Template.saveFile(refile, session, "/resources/image/employeeImage/");
                userInfo.setChangeName("/resources/image/employeeImage/" + changeName);
                userInfo.setOriginName(refile.getOriginalFilename());
                userInfo.setFilePath("/resources/image/employeeImage/");

                int fileresult = employeeService.updateEmployeeImage(userInfo);
                int result = employeeService.updateEmployeeDetailSearch(userInfo);


                if (result > 0) {
                    session.setAttribute("alertMsg", "게시글 수정 성공");
                    return "redirect:/empAdminList.erp";

                } else {
                    model.addAttribute("errorMsg", "게시글 수정 실패");
                    return "common/errorPage";
                }
            }
        }
    }