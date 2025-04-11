package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.services.IncomeService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class IncomeController {

    private final IncomeService incomeService;

    // 매출관리 페이지로 가기
    @GetMapping("income.erp")
    public String income(@RequestParam(defaultValue = "1") int inpage, Model model, HttpSession session) {
        String svg = "/image/erpIcon/sales.png";

        int incomeCount = incomeService.selectIncomeCount();

        PageInfo pi = new PageInfo(incomeCount, inpage,10,10);
        ArrayList<SalesDetails> list = incomeService.selectIncomeList(pi);


        //매출 총이익
        int details = incomeService.selectIncomeAllSales();


        model.addAttribute("incomeCount", incomeCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);
        model.addAttribute("details", details);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "매출 관리");

        return "erpPage/incomePage";
    }

    // 매출 검색
    @GetMapping("/search.in")
    public String searchIncome(
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "date1", required = false) String startDate,
            @RequestParam(value = "date2", required = false) String endDate,
            @RequestParam(value = "company", required = false) String company,
            @RequestParam(defaultValue = "1") int inpage, Model model) {

        if ((type == null || type.isEmpty()) &&
                (startDate == null || startDate.isEmpty()) &&
                (endDate == null || endDate.isEmpty()) &&
                (company == null || company.isEmpty())) {
            return "redirect:/income.erp";
        }

        //조건에 맞는 매출 총이익 구하기
        int details = incomeService.selectIncomeAllSalesDetails(type, startDate, endDate, company);
        
        int totalSalesSum = incomeService.searchIncomeSum(type, startDate, endDate, company);


        // 조건에 맞는 매출 수 구하기
        int incomeCount = incomeService.selectSerachIncomeCount(type, startDate, endDate, company);
        PageInfo pi = new PageInfo(incomeCount, inpage, 10, 10);

        // 검색 실행
        ArrayList<SalesDetails> list = incomeService.selectSearchIncomeList(pi, type, startDate, endDate, company);
        if (list.isEmpty()) {
            model.addAttribute("message", "검색 결과가 없습니다.");
        }
        
        model.addAttribute("details", details);
        model.addAttribute("incomeCount", incomeCount);
        model.addAttribute("pi", pi);
        model.addAttribute("list", list);
        model.addAttribute("totalSalesSum", totalSalesSum);
        // 검색 조건도 모델에 담아야 페이지 이동할 때 유지됨
        model.addAttribute("type", type);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("company", company);


        return "erpPage/incomePage"; // 결과 페이지
    }

    // 매출 상세보기
    @GetMapping("detail.in")
    public String detailIncome(int gno, Model model) {

        ArrayList<SalesDetails> list = incomeService.incomeDetail(gno);
        model.addAttribute("list", list);
        return "erpPage/incomeDetailPage";
    }


}
