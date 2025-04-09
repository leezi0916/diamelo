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
        String svg = "<svg width=\"20\" height=\"25\" viewBox=\"0 0 20 25\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                "                            <path d=\"M7.91444 25V22.0139C6.02496 21.7361 4.3943 21.2037 3.02246 20.4167C1.6492 19.6296 0.641711 18.5185 0 17.0833L3.95722 16.0417C4.49198 17.1528 5.28556 17.9977 6.33797 18.5764C7.38895 19.1551 8.77005 19.4444 10.4813 19.4444C11.943 19.4444 13.1822 19.2306 14.1989 18.8028C15.2143 18.3741 15.7219 17.7083 15.7219 16.8056C15.7219 15.9954 15.3298 15.3528 14.5455 14.8778C13.7611 14.4037 11.943 13.8657 9.09091 13.2639C6.02496 12.6389 3.92157 11.8926 2.78075 11.025C1.63993 10.1565 1.06952 9.09722 1.06952 7.84722C1.06952 6.34259 1.81818 5.17361 3.31551 4.34028C4.81283 3.50694 6.34581 3.03241 7.91444 2.91667V0H12.1925V2.91667C13.975 3.10185 15.446 3.52407 16.6054 4.18333C17.7633 4.84352 18.6096 5.64815 19.1444 6.59722L15.1872 7.70833C14.7594 6.96759 14.1533 6.41204 13.369 6.04167C12.5847 5.6713 11.5152 5.48611 10.1604 5.48611C8.5918 5.48611 7.3975 5.71204 6.57754 6.16389C5.75758 6.61481 5.34759 7.17593 5.34759 7.84722C5.34759 8.61111 5.88235 9.21296 6.95187 9.65278C8.02139 10.0926 9.87522 10.5556 12.5134 11.0417C14.9733 11.5046 16.8364 12.2394 18.1027 13.2458C19.3676 14.2532 20 15.4167 20 16.7361C20 18.3796 19.2513 19.6296 17.754 20.4861C16.2567 21.3426 14.4029 21.875 12.1925 22.0833V25H7.91444Z\"\n" +
                "                                    fill=\"black\"/>\n" +
                "                        </svg>";

        int incomeCount = incomeService.selectIncomeCount();

        PageInfo pi = new PageInfo(incomeCount, inpage,10,10);
        ArrayList<SalesDetails> list = incomeService.selectIncomeList(pi);

        model.addAttribute("incomeCount", incomeCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

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


        int totalSalesSum = incomeService.searchIncomeSum(type, startDate, endDate, company);


        // 조건에 맞는 매출 수 구하기
        int incomeCount = incomeService.selectSerachIncomeCount(type, startDate, endDate, company);
        PageInfo pi = new PageInfo(incomeCount, inpage, 10, 10);

        // 검색 실행
        ArrayList<SalesDetails> list = incomeService.selectSearchIncomeList(pi, type, startDate, endDate, company);
        if (list.isEmpty()) {
            model.addAttribute("message", "검색 결과가 없습니다.");
        }


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
        System.out.println(list);
        model.addAttribute("list", list);
        return "erpPage/incomeDetailPage";
    }


}
