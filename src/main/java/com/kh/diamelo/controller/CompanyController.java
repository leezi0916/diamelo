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
        String svg = "<svg width=\"25\" height=\"25\" viewBox=\"0 0 25 25\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                "                            <path d=\"M12.7522 22.3237C12.5477 22.5488 12.1841 22.5863 11.9456 22.3237C11.741 22.0986 11.707 21.6983 11.9456 21.4357L15.7971 17.1961L14.1951 15.4327L10.3436 19.6723C10.1277 19.9225 9.76413 19.91 9.5369 19.6723C9.29831 19.4097 9.33239 19.0095 9.5369 18.7844L13.3885 14.5448L11.7865 12.7814L7.93492 17.021C7.73041 17.2461 7.36684 17.2836 7.12825 17.021C6.91238 16.7834 6.91238 16.3832 7.12825 16.1331L10.9798 11.8934L9.36648 10.1301L5.5149 14.3697C5.3104 14.5948 4.94683 14.6323 4.70823 14.3697C4.49236 14.1196 4.49236 13.7319 4.70823 13.4817L9.6846 8.004L11.8092 10.3302C12.8886 11.5183 14.7519 11.5058 15.8312 10.3302C16.9446 9.10455 16.9446 7.12856 15.8312 5.90295L13.718 3.57679L14.0361 3.22661C14.9223 2.25113 16.3652 2.25113 17.2514 3.22661L22.0687 8.52926C22.9549 9.50475 22.9549 11.093 22.0687 12.0685L12.7522 22.3237ZM23.6707 13.8444C25.4431 11.8934 25.4431 8.72936 23.6707 6.76588L18.8534 1.46323C17.081 -0.487744 14.2065 -0.487744 12.4227 1.46323L12.1046 1.81341L11.7865 1.46323C10.0141 -0.487744 7.13961 -0.487744 5.35584 1.46323L1.33385 5.89045C-0.279497 7.66633 -0.427197 10.4302 0.879384 12.3812L2.52681 10.5678C2.08371 9.62982 2.23141 8.44172 2.94719 7.65383L6.96919 3.22661C7.85539 2.25113 9.29831 2.25113 10.1845 3.22661L14.2292 7.67884C14.4337 7.90395 14.4678 8.30415 14.2292 8.56678C13.9906 8.82942 13.6271 8.7919 13.4226 8.56678L9.6846 4.46473L3.09489 11.7059C1.98146 12.919 1.98146 14.9075 3.09489 16.1331C3.53799 16.6208 4.10607 16.921 4.70823 17.0085C4.78776 17.6588 5.04908 18.2841 5.50354 18.7844C5.95801 19.2846 6.52609 19.5723 7.11689 19.6598C7.19642 20.3102 7.45773 20.9355 7.9122 21.4357C8.36666 21.936 8.93474 22.2236 9.52554 22.3112C9.60507 22.9865 9.87775 23.5993 10.3208 24.087C10.8548 24.6748 11.5706 25 12.3318 25C13.0931 25 13.8089 24.6748 14.3428 24.087L23.6707 13.8444Z\"\n" +
                "                                    fill=\"black\"/>\n" +
                "                        </svg>";
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
