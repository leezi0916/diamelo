package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.*;
import java.text.SimpleDateFormat;
import jakarta.servlet.http.HttpSession;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import com.kh.diamelo.services.BuyService;
import com.kh.diamelo.services.SaleService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Date;
import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class SaleController {
    private final SaleService saleService;

    // 판매관리 페이지로 가기
    @GetMapping("saleList.erp")
    public String sale(@RequestParam(defaultValue = "1") int spage, Model model, HttpSession session) {
        String svg = "<svg width=\"25\" height=\"25\" viewBox=\"0 0 25 25\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                "                            <path d=\"M3.81944 0C3.57682 0.000129717 3.33847 0.0638077 3.1281 0.184694C2.91774 0.305581 2.74271 0.479459 2.62044 0.689019L0.189887 4.85569C0.0657367 5.06805 0.00020778 5.30957 0 5.55556V22.2222C0 23.7404 1.25963 25 2.77778 25H22.2222C23.7404 25 25 23.7404 25 22.2222V5.55556C24.9998 5.30957 24.9343 5.06805 24.8101 4.85569L22.3796 0.689019C22.2573 0.479459 22.0823 0.305581 21.8719 0.184694C21.6615 0.0638077 21.4232 0.000129765 21.1806 0H3.81944ZM4.61697 2.77778H20.383L22.0025 5.55556H2.9975L4.61697 2.77778ZM2.77778 8.33333H22.2222V22.2222H2.77778V8.33333ZM8.33333 11.1111V13.8889H16.6667V11.1111H8.33333Z\"\n" +
                "                                    fill=\"black\"/>\n" +
                "                        </svg>";


        int salesListCount =  saleService.salesListCount();


        PageInfo pi = new PageInfo(salesListCount, spage, 10, 10);
        ArrayList<InoutGroup> list = saleService.selectSalesList(pi);



        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "판매 관리");
        return "erpPage/salePage";
    }

    // 판매 상세보기
    @GetMapping("saleDList.erp")
    public String detailSale(@RequestParam("sNo")int sNo, Model model) {
        System.out.println("sNo: " + sNo);
        int resSum = 0;
        InoutGroup inoutGroup = new InoutGroup();
        ArrayList<Product> list = saleService.selectSaleDetailList(sNo);
        String companyName = saleService.selectInoutGroup(sNo);
        System.out.println("list: " + list);
        System.out.println("companyName: " + companyName);

        for (Product product : list) {
            resSum += product.getHistoryStock();
        }
        System.out.println("resSum: " + resSum);

        System.out.println("inoutGroup: " + inoutGroup);
        inoutGroup.setSalesAmount(resSum);
        System.out.println("list: " + list);


        System.out.println("inoutGroup2 :: " + inoutGroup);

        model.addAttribute("sNo", sNo);
        model.addAttribute("resSum", resSum);
        model.addAttribute("companyName", companyName);
        model.addAttribute("list", list);


        return "erpPage/saleDetailPage";
    }

    // 판매 승인
    @GetMapping("buyAcc.erp")
    public String acceptSale(@RequestParam("sNo")int sNo, Model model, HttpSession session) {
        SalesDetails salesDetails = new SalesDetails();
        String groupStatus = saleService.selectGroupStatus(sNo);
        System.out.println("groupStatus: " + groupStatus);

        if(groupStatus.equals("Y")) {
            session.setAttribute("alertMsg", "이미 승인상태입니다.");
            return "redirect:/saleList.erp";
        } else if(groupStatus.equals("W")) {
            int updateStatus = saleService.updateStatus(sNo);


            ArrayList<Product> list = saleService.selectSaleDetailList(sNo);
            System.out.println("Statuslist: " + list);
            for (Product product : list) {

                int updateProduct = saleService.updateProduct(product);
                String userId = saleService.selectUserId(sNo);
                System.out.println("userId: " + userId);
                salesDetails.setUserId(userId);
                salesDetails.setSalesAmount(product.getProPrice());
                salesDetails.setSalesStock(product.getHistoryStock());
                salesDetails.setChangeName(product.getChangeName());
                salesDetails.setGroupNo(product.getGroupNo());
                salesDetails.setProName(product.getProName());

                System.out.println("salesDetails: " + salesDetails);

                int resIn = saleService.insertSalesDetails(salesDetails);
            }



            //여기 들어가야함

            if(updateStatus == 1) {
                session.setAttribute("alertMsg", "수정 되었습니다.");
            }else{
                session.setAttribute("alertMsg", "실패하였습니다.");
            }
            return "redirect:/saleList.erp";
        }else{
            session.setAttribute("alertMsg", "반려는 변경하실 수 없습니다.");
            return "redirect:/saleList.erp";
        }
    }

    // 판매 반려
    @GetMapping("buyRef.erp")
    public String refusalSale(@RequestParam("sNo")int sNo, Model model, HttpSession session) {
        String groupStatus = saleService.selectGroupStatus(sNo);
        System.out.println("groupStatus: " + groupStatus);

        if(groupStatus.equals("Y")) {
            session.setAttribute("alertMsg", "이미 승인상태입니다.");
            return "redirect:/saleList.erp";
        } else if(groupStatus.equals("W")) {
            int updateStatus = saleService.updateStatusN(sNo);
            if(updateStatus == 1) {
                session.setAttribute("alertMsg", "수정 되었습니다.");
            }else{
                session.setAttribute("alertMsg", "실패하였습니다.");
            }
            System.out.println("updateStatus: " + updateStatus);
            return "redirect:/saleList.erp";
        }else{
            session.setAttribute("alertMsg", "반려는 변경하실 수 없습니다.");
            return "redirect:/saleList.erp";
        }
    }


    @GetMapping("salSearList.erp")
    public String searSale(@RequestParam(defaultValue = "1") int spage,String startDate, String endDate, String company, Model model, HttpSession session) {
        System.out.println("spage: " + spage);
        System.out.println("startDate: " + startDate);
        System.out.println("endDate: " + endDate);
        System.out.println("company: " + company);


        if (startDate != null && startDate.trim().isEmpty()){
            startDate = null;
        }
        if (endDate != null && endDate.trim().isEmpty()){
            endDate = null;
        }
        int selCount = saleService.selectSearchCount(company, startDate, endDate);

        System.out.println("selCount: " + selCount);
        PageInfo pi = new PageInfo(selCount, spage, 10, 10);
        ArrayList<InoutGroup> list = saleService.selectSearchList(pi, company, startDate, endDate);


        System.out.println("list: " + list);



        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("company", company);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);



        return "erpPage/salePage";
    }




}
