package com.kh.diamelo.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Product;
import com.kh.diamelo.domain.vo.SalesDetails;
import com.kh.diamelo.services.BuyService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@RequiredArgsConstructor
@Controller
public class BuyController {
    private final BuyService buyService;

    // 구매조회
    @GetMapping("search.buy")
    public String searchBuy() {
        return null;
    }

    // 구매서 등록
//    @GetMapping("buyAdd.erp")
//    public String buyAddPage() {
//        return "erpPage/materialBuyPage";
//    }

    //구매 상세보기
    @GetMapping("buyDetail.erp")
    public String detailBuy(@RequestParam("sNo")int sNo, Model model) {
        System.out.println("sNo = " + sNo);




        return "erpPage/buyDetailPage";
    }

    //재료구매신청 버튼
    @PostMapping("mat.buy")
    public String materialBuy(@RequestParam("orderDetails")String orderDetail , Model model) {
        Random random = new Random();
        int resultNum;
        int rNum;
        ObjectMapper mapper = new ObjectMapper();
        ArrayList<Product> orderDetails = null;
        try {
            // JSON 문자열을 List<OrderDetail>로 변환
            orderDetails = mapper.readValue(orderDetail, new TypeReference<ArrayList<Product>>() {});

        } catch (IOException e) {
            e.printStackTrace();
            // 적절한 예외 처리
        }

        do {

            rNum = random.nextInt(999999) + 10000;
            int selectNum = buyService.selectHistoryNo(rNum); //0 또는 1 // 0이면 없는것 1이면 있는것

            if(selectNum == 0) {
                resultNum = 0;
            }else{
                resultNum = 1;
            }
        }
        while(resultNum ==1);

        System.out.println("rNum"+rNum);

        for(Product product : orderDetails) {
            product.setHistoryNo((rNum));;
        }

        System.out.println(orderDetails);
        int result = buyService.insertOrderDetails(orderDetails);

        System.out.println(orderDetails);

        System.out.println("orderDetail"+orderDetail);
        System.out.println("orderDetail.list"+orderDetail);
        return "erpPage/buyPage";
    }

    //구매관리 페이지로 가기
    @GetMapping("buyList.erp")
    public String buyList(@RequestParam(defaultValue = "1") int bpage, Model model){
        int buyCount = buyService.selectBuyCount();

        PageInfo pi = new PageInfo(buyCount, bpage, 10, 10);
        ArrayList<SalesDetails> list = buyService.selectBuyList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

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
