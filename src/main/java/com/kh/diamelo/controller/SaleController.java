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
        String svg = "/image/erpIcon/sale.png";


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
        String groupStatus = saleService.selectGroupStatus(sNo);
        inoutGroup.setGroupStatus(groupStatus);
        inoutGroup.setSalesAmount(resSum);
        System.out.println("list: " + list);
//        boolean YAndN = false;
//        for(Product product : list){
//            YAndN = product.getProInventStock() >= product.getHistoryStock();
//            System.out.println("YAndN::::::" +YAndN);
//            if(!YAndN){
//                break;
//            }
//        }

        System.out.println("inoutGroup2 :: " + inoutGroup);
        model.addAttribute("groupStatus", groupStatus);

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
        int resSum = 0;
        if(groupStatus.equals("Y")) {
            session.setAttribute("alertMsg", "이미 승인상태입니다.");
            return "redirect:/saleList.erp";
        } else if(groupStatus.equals("W")) {

            ArrayList<Product> list = saleService.selectSaleDetailList(sNo);
            boolean YAndN = false;
            for(Product product : list){
                YAndN = product.getProInventStock() >= product.getHistoryStock();
                System.out.println("YAndN::::::" +YAndN);
                if(!YAndN){
                    break;
                }
            }

            System.out.println("YAndN" +YAndN);

            if (YAndN) {
                int updateStatus = saleService.updateStatus(sNo);

                String groupType = saleService.selectGroupNo(sNo);
                System.out.println("Statuslist: " + list);
                for (Product product : list) {
                    resSum += product.getHistoryStock() * product.getProPrice();

                    if("O".equals(groupType)) {
                        int updateProduct = saleService.updateProductPlus(product);
                    }else{
                        int updateProduct = saleService.updateProductMinus(product);
                    }

                    String userId = saleService.selectUserId(sNo);
                    System.out.println("userId: " + userId);
                    salesDetails.setUserId(userId);
                    salesDetails.setSalesAmount(resSum);
                    salesDetails.setSalesStock(product.getHistoryStock());
                    salesDetails.setChangeName(product.getChangeName());
                    salesDetails.setGroupNo(product.getGroupNo());
                    salesDetails.setProName(product.getProName());

                    System.out.println("salesDetails: " + salesDetails);

                    int resIn = saleService.insertSalesDetails(salesDetails);
                }

                if(updateStatus == 1) {
                    session.setAttribute("alertMsg", "수정 되었습니다.");
                }else{
                    session.setAttribute("alertMsg", "실패하였습니다.");
                }
                return "redirect:/saleList.erp";
            }else{


            session.setAttribute("alertMsg", "재고부족인해 거절되었습니다.");
            return "redirect:/saleList.erp";
          }

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
