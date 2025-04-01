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

    @GetMapping("enroll.bo")
    public String boardEnroll() {
        return "erpPage/boardEnrollForm";
    }

    @GetMapping("detail.bo")
    public String boardDetail() {
        return "erpPage/boardDetailView";
    }

    @GetMapping("search.bo")
    public String boardSearch() {
        return "";
    }

    @GetMapping("update.bo")
    public String boardUpdate() {
        return "";
    }


}
