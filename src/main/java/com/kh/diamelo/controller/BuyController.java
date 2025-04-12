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
        int resSum = 0;
        int resQty = 0;

        Product product = new Product();
        product = buyService.selectInOutHistory(gNo);
        System.out.println("product"+product);




        ArrayList<Product> productList = new ArrayList<>();
        productList = buyService.selectMatDetailList(gNo);
        System.out.println("productList"+ productList);
        for (Product p : productList) {
            resSum += p.getAmount();
            resQty += 1;
        }

        model.addAttribute("resQty", resQty);
        model.addAttribute("resSum",resSum);

        model.addAttribute("productList", productList);
        model.addAttribute("product", product);







        return "erpPage/buyDetailPage";
    }

    //재료구매신청 버튼

    @PostMapping("mat.buy")
    public String materialBuy(@RequestParam("orderDetails")String orderDetail, HttpSession session,  Model model) {
//        Random random = new Random();
//        int resultNum;
//        int rNum;
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

        System.out.println(orderDetails);

        inoutGroup.setUserId(loginUser.getUserId());

        int groupresult = buyService.insertInoutGroup(inoutGroup);

        int resGNo = buyService.selectGroupNo();



        for(Product product : orderDetails) {
            String proName =product.getProName();
            System.out.println("productproduct"+product);
            int proNo = product.getProNo();

            int proPrice = buyService.selectMatPrice(proNo);

            product.setProNo(product.getProNo());
            product.setProPrice(proPrice);
            product.setGroupNo((resGNo));
            int result = buyService.insertOrderDetails(product);
            int sumPrice = product.getProPrice()*product.getQty();
            Product changeName = buyService.selectfilePath(proNo);
            salesDetails.setSalesAmount(sumPrice);
            salesDetails.setSalesStock(product.getQty());
            salesDetails.setProName(proName);
            salesDetails.setChangeName(changeName.getChangeName());
            salesDetails.setUserId(loginUser.getUserId());
            salesDetails.setGroupNo(resGNo);

            int insertresult = buyService.insertBuySalesDetails(salesDetails);
            int updateProResult = buyService.updateProductInventory(product);
        }

        return "redirect:/buyList.erp";
    }


    //구매관리 페이지로 가기
    @GetMapping("buyList.erp")
    public String buyList(@RequestParam(defaultValue = "1") int bpage, Model model, HttpSession session) {
        String svg = "/image/erpIcon/buy.png";

        int buyCount = buyService.selectBuyCount();


        PageInfo pi = new PageInfo(buyCount, bpage, 10, 10);
        ArrayList<SalesDetails> list = buyService.selectBuyList(pi);
        System.out.println("listlist" + list);

        model.addAttribute("buyCount", buyCount);
        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "구매 관리");

        return "erpPage/buyPage";
    }


    //구매 검색 조회
    @GetMapping("search.buy")
    public String searchBuy(@RequestParam(defaultValue = "1") int bpage,String startDate, String endDate, String user, Model model) {


        if (startDate != null && startDate.trim().isEmpty()){
            startDate = null;
        }
        if (endDate != null && endDate.trim().isEmpty()){
            endDate = null;
        }
        String searchId = buyService.selectUserId(user);
        int buyCount = buyService.selectSearchCount(startDate, endDate, searchId);
        System.out.println("buyCount" + buyCount);
        PageInfo bpi = new PageInfo(buyCount, bpage, 10, 10);

        ArrayList<SalesDetails> blist = buyService.selectSearchList(bpi, startDate, endDate, searchId);
        System.out.println("bpi"+bpi);

        model.addAttribute("buyCount", buyCount);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("user", user);

        model.addAttribute("list", blist);
        model.addAttribute("pi", bpi);

        return "erpPage/buyPage";
    }

    // 구매서 등록
    @GetMapping("buyAdd.erp")
    public String buyDetail( Model model){

        ArrayList<Product> list = buyService.selectProduceBuyList();
        System.out.println("list" + list);

        model.addAttribute("list", list);
        return "erpPage/materialBuyPage";
    }

}
