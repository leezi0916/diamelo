package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.domain.vo.UserInfo;
import com.kh.diamelo.services.ErpMainService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashMap;

@RequiredArgsConstructor
@Controller
public class ErpMainController {


    private final ErpMainService erpMainService;
    // 사내 메인홈페이지로 가기
    @GetMapping("home.erp")
    public String home(HttpSession session, Model model) {

        String svg = "/image/erpIcon/home.png";

        //오늘의 매출 갖고오기
        int todaySales = erpMainService.selectTodaySales();
        model.addAttribute("todaySales", todaySales);

        //판매 현황 조회 W Y N
        int salesStatus1 = erpMainService.countSalesStatus1();
        int salesStatus2 = erpMainService.countSalesStatus2();
        int salesStatus3 = erpMainService.countSalesStatus3();

        model.addAttribute("salesStatus1", salesStatus1);
        model.addAttribute("salesStatus2", salesStatus2);
        model.addAttribute("salesStatus3", salesStatus3);

        //직원 수 count
        int employeeCount = erpMainService.countEmployee();
        model.addAttribute("employeeCount", employeeCount);

        //가장 부족한 재고 현황
        Product product = erpMainService.notEnoughProduct();
        model.addAttribute("product", product);

        //최근 3개월 매출합 구하기
        int recentSalesSum = erpMainService.recentSalesSum();
        model.addAttribute("recentSalesSum", recentSalesSum);

        //최근 3개월간 매출 그래프
        ArrayList<HashMap<String, Object>> monthlySales = erpMainService.selectMonthlySales();
        model.addAttribute("monthlySales", monthlySales);




        //로그인된 정보로 회원사진 부서명 직급명 갖고오기
        UserInfo loginUser= (UserInfo) session.getAttribute("loginUser");

        if (loginUser != null) {
            String userId = loginUser.getUserId();

            UserInfo userInfo = erpMainService.selectUserInfo(userId);
            model.addAttribute("userInfo", userInfo);
        }



        //최신 공지사항 게시판 검색
        ArrayList<Board> list1 = erpMainService.selectBoardList1();
        //최신 문의사항 게시판 검색
        ArrayList<Board> list2 = erpMainService.selectBoardList2();

        model.addAttribute("list1", list1);
        model.addAttribute("list2", list2);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "HOME");
        return "erpPage/homePage";
    }

}

