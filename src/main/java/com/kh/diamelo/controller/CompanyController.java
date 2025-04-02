package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.CompanyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class CompanyController {

    private final CompanyService companyService;

    // 거래관리 페이지로 가기
    @GetMapping("company.erp")
    public String company(@RequestParam(defaultValue = "1")int apage, Model model) {
        int boardCount = companyService.selectCompanySuccessCount();

        PageInfo pi = new PageInfo(boardCount,  apage, 10 ,2);
        ArrayList<UserInfo> list = companyService.selectCompanyList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi",pi);

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

}
