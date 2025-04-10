package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.CompanyService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@Controller
@RequiredArgsConstructor

public class CompanyController {

    private final CompanyService companyService;

    // 거래관리 페이지로 가기
    @GetMapping("company.erp")
    public String company(@RequestParam(defaultValue = "1")int apage, Model model,HttpSession session) {
        String svg = "/image/erpIcon/company.png";

        int boardCount = companyService.selectCompanySuccessCount();

        PageInfo pi = new PageInfo(boardCount,  apage, 10 ,10);
        ArrayList<UserInfo> list = companyService.selectCompanyList(pi);

        model.addAttribute("boardCount", boardCount);
        model.addAttribute("list", list);
        model.addAttribute("pi",pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "거래 관리");

        return "erpPage/companyMainPage";
    }

    //거래처 관리자 페이지로 들어가기
    @GetMapping("compAdmin.erp")
    public String compAdmin(@RequestParam(defaultValue = "1")int cpage, Model model) {
        int boardCount = companyService.selectCompanyReadyCount();

        PageInfo pi = new PageInfo(boardCount,  cpage, 10 ,10);
        ArrayList<UserInfo> list = companyService.selectAllList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi",pi);

        return "erpPage/companyAdminPage";}

    //거래처 조건 검색
    @GetMapping("select.com")
    public String selectCompany(@RequestParam(defaultValue = "1")int apage, @RequestParam(value = "companyName") String companyName,
                                @RequestParam(value = "userName")String userName, Model model) {
        int boardCount = companyService.selectCompanyDetailCount(companyName, userName);

        PageInfo pi = new PageInfo(boardCount,  apage, 10 ,10);
        ArrayList<UserInfo> list = companyService.selectCompanyDetailList(companyName, userName, pi);

        model.addAttribute("list", list);
        model.addAttribute("pi",pi);

        model.addAttribute("companyName", companyName);
        model.addAttribute("userName", userName);
        return "erpPage/companyMainPage";
    }

    // 거래처 관리자 페이지 조건 검색
    @GetMapping("select.ad")
    public String selectAdminPage(@RequestParam(defaultValue = "1")int cpage, @RequestParam(value = "type")String type,
                                  @RequestParam(value = "companyName") String companyName,
                                @RequestParam(value = "userName")String userName,  Model model) {
        int boardCount = companyService.selectAdminPageCompanyCount(type, companyName, userName);

        PageInfo pi = new PageInfo(boardCount,  cpage, 10 ,10);
        ArrayList<UserInfo> list = companyService.selectAdminPageDetailList(type, companyName, userName, pi);

        model.addAttribute("list", list);
        model.addAttribute("pi",pi);

        model.addAttribute("type", type);
        model.addAttribute("companyName", companyName);
        model.addAttribute("userName", userName);
        return "erpPage/companyAdminPage";
    }

    //거래처 관리자 페이지 거래처 삭제
    @GetMapping("delete.com")
    public String companyDelete(UserInfo userInfo, Model model, HttpSession session) {
        int companyDelete = companyService.deleteCompany(userInfo);

        if(companyDelete > 0) {
            session.setAttribute("alertMsg", "거래처 삭제 성공");
            return "redirect:/compAdmin.erp";
        }else{
            model.addAttribute("errorMsg", "거래처 삭제 실패");
            return "common/erp/erpErrorPage";
        }
    }
}
