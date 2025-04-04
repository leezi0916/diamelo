package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.services.IncomeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class IncomeController {

    private final IncomeService incomeService;

    // 매출관리 페이지로 가기
    @GetMapping("income.erp")
    public String income(@RequestParam(defaultValue = "1") int inpage, Model model) {
        int incomeCount = incomeService.selectIncomeCount();

        PageInfo pi = new PageInfo(incomeCount, inpage,10,10);
        ArrayList<SalesDetails> list = incomeService.selectIncomeList(pi);

        model.addAttribute("incomeCount", incomeCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/incomePage";
    }

    // 매출 검색
    @GetMapping("/search.in")
    public String searchIncome(
            @RequestParam(value = "type", required = false) String type,
            @RequestParam(value = "date1", required = false) String startDate,
            @RequestParam(value = "date2", required = false) String endDate,
            @RequestParam(value = "company", required = false) String company,
            Model model) {

        // type이 빈 문자열이면 null로 처리 (검색 조건에서 제외)
        if (type != null && type.isEmpty()) {
            type = null;
        }

        // 모든 값이 없으면 검색 막기
        if ((startDate == null || startDate.isEmpty()) &&
                (endDate == null || endDate.isEmpty()) &&
                (company == null || company.isEmpty())) {
            model.addAttribute("error", "검색 조건을 하나 이상 입력해주세요.");
            return "erpPage/incomePage"; // 검색 페이지로 다시 이동
        }

        // 검색 실행
//        ArrayList<SalesDetails> incomeList = incomeService.selectIncomeList(type, startDate, endDate, company);
//        model.addAttribute("list", incomeList);

        return "erpPage/incomePage"; // 결과 페이지
    }

    // 매출 상세보기
    @GetMapping("detail.in")
    public String detailIncome() {
        return "erpPage/incomeDetailPage";
    }
}
