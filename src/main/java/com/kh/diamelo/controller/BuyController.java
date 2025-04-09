package com.kh.diamelo.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.diamelo.domain.vo.*;
import com.kh.diamelo.interceptor.LoginInterceptor;
import com.kh.diamelo.services.BuyService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

@RequiredArgsConstructor
@Controller
public class BuyController {
    private final BuyService buyService;
    private final LoginInterceptor loginInterceptor;



    // 구매서 등록
//    @GetMapping("buyAdd.erp")
//    public String buyAddPage() {
//        return "erpPage/materialBuyPage";
//    }

    //구매 상세보기
    @GetMapping("buyDetail.erp")
    public String detailBuy(@RequestParam("gNo")int gNo, Model model) {
        System.out.println("gNo = " + gNo);

        Product product = new Product();
        product = buyService.selectInOutHistory(gNo);


        System.out.println("product = " + product);

        ArrayList<Product> productList = new ArrayList<>();
        productList = buyService.selectMatDetailList(gNo);

        System.out.println("productList = " + productList);

        model.addAttribute("productList", productList);
        model.addAttribute("product", product);







        return "erpPage/buyDetailPage";
    }

    //재료구매신청 버튼

    @PostMapping("mat.buy")
    public String materialBuy(@RequestParam("orderDetails")String orderDetail, HttpSession session,  Model model) {
        Random random = new Random();
        int resultNum;
        int rNum;
        ObjectMapper mapper = new ObjectMapper();
        ArrayList<Product> orderDetails = null;
        InoutGroup inoutGroup = new InoutGroup();
        SalesDetails salesDetails = new SalesDetails();
        UserInfo loginUser = (UserInfo) session.getAttribute("loginUser");

        try {
            // JSON 문자열을 List<OrderDetail>로 변환
            orderDetails = mapper.readValue(orderDetail, new TypeReference<ArrayList<Product>>() {});

        } catch (IOException e) {
            e.printStackTrace();
            // 적절한 예외 처리
        }
        do {
            rNum = random.nextInt(999999) + 10000;
            String selectNum = buyService.selectGroupNo(rNum); //0 또는 1 // 0이면 없는것 1이면 있는것

            if(selectNum == null) {
                resultNum = 0;
            }else{
                resultNum = 1;
            }
        }
        while(resultNum ==1);

        inoutGroup.setGroupNo(rNum);
        inoutGroup.setUserId(loginUser.getUserId());

        int groupresult = buyService.insertInoutGroup(inoutGroup);


        for(Product product : orderDetails) {
            String proName =product.getProName();

            int proNo = buyService.selectProNo(proName);
            int proPrice = buyService.selectMatPrice(proName);

            product.setProNo(proNo);
            product.setProPrice(proPrice);
            product.setGroupNo((rNum));

            int result = buyService.insertOrderDetails(product);

            Product changeName = buyService.selectfilePath(proName);
            salesDetails.setSalesAmount(product.getProPrice());
            salesDetails.setSalesStock(product.getQty());
            salesDetails.setProName(proName);
            salesDetails.setChangeName(changeName.getChangeName());
            salesDetails.setUserId(loginUser.getUserId());
            salesDetails.setGroupNo(rNum);

            int insertresult = buyService.insertSalesDetails(salesDetails);
            int updateProResult = buyService.updateProductInventory(product);
        }

        return "redirect:/buyList.erp";
    }

    //구매관리 페이지로 가기
    @GetMapping("buyList.erp")
    public String buyList(@RequestParam(defaultValue = "1") int bpage, Model model, HttpSession session) {
        String svg = "<svg width=\"25\" height=\"25\" viewBox=\"0 0 25 25\" fill=\"none\" xmlns=\"http://www.w3.org/2000/svg\">\n" +
                "                            <path d=\"M18.1807 13.75C19.1179 13.75 19.9426 13.2375 20.3674 12.4625L24.8408 4.35C25.3031 3.525 24.7033 2.5 23.7537 2.5H5.26055L4.08598 0H0V2.5H2.49907L6.9974 11.9875L5.31053 15.0375C4.39837 16.7125 5.59792 18.75 7.49722 18.75H22.4916V16.25H7.49722L8.87171 13.75H18.1807ZM6.44761 5H21.6295L18.1807 11.25H9.40901L6.44761 5ZM7.49722 20C6.12273 20 5.01064 21.125 5.01064 22.5C5.01064 23.875 6.12273 25 7.49722 25C8.87171 25 9.99629 23.875 9.99629 22.5C9.99629 21.125 8.87171 20 7.49722 20ZM19.9926 20C18.6181 20 17.506 21.125 17.506 22.5C17.506 23.875 18.6181 25 19.9926 25C21.3671 25 22.4916 23.875 22.4916 22.5C22.4916 21.125 21.3671 20 19.9926 20Z\"\n" +
                "                                    fill=\"black\"/>\n" +
                "                        </svg>";

        int buyCount = buyService.selectBuyCount();
        System.out.println("buyCount = " + buyCount);

        PageInfo pi = new PageInfo(buyCount, bpage, 10, 10);
        ArrayList<SalesDetails> list = buyService.selectBuyList(pi);

        model.addAttribute("buyCount", buyCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "구매 관리");

        return "erpPage/buyPage";
    }
    //구매 검색 조회
    @GetMapping("search.buy")
    public String searchBuy(@RequestParam(defaultValue = "1") int bpage,String Date, String tDate, String user, Model model) {
        System.out.println("user :"+user);
        System.out.println("Date :"+Date);
        System.out.println("tDate :"+tDate);

        if (Date != null && Date.trim().isEmpty()) Date = null;
        if (tDate != null && tDate.trim().isEmpty()) tDate = null;
        String searchId = buyService.selectUserId(user);
        int buyCount = buyService.selectSearchCount(Date, tDate, searchId);
        System.out.println("buyCount = " + buyCount);
        PageInfo bpi = new PageInfo(buyCount, bpage, 10, 10);

        ArrayList<SalesDetails> blist = buyService.selectSearchList(bpi, Date, tDate, searchId);
        model.addAttribute("blist", blist);
        model.addAttribute("bpi", bpi);

        return "erpPage/buyPage";
    }

    // 구매서 등록
    @GetMapping("buyAdd.erp")
    public String buyDetail( Model model){

        ArrayList<Product> list = buyService.selectProduceBuyList();

        model.addAttribute("list", list);
        return "erpPage/materialBuyPage";
    }

}
