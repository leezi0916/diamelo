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
    public String buyList(@RequestParam(defaultValue = "1") int bpage, Model model){
        int buyCount = buyService.selectBuyCount();
        System.out.println("buyCount = " + buyCount);

        PageInfo pi = new PageInfo(buyCount, bpage, 10, 10);
        ArrayList<SalesDetails> list = buyService.selectBuyList(pi);

        model.addAttribute("buyCount", buyCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

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
