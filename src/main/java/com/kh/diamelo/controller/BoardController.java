package com.kh.diamelo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class BoardController {

    // 게시판관리 페이지로 가기
    @GetMapping("board.erp")
    public String board() {
        return "erpPage/boardMainPage";
    }

}
