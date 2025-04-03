package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import com.kh.diamelo.services.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class BoardController {

    private final BoardService boardService;
    // 게시판관리 페이지로 가기
    @GetMapping("board.erp")
    public String board(@RequestParam(defaultValue = "1")int bpage, Model model) {
        int boardCount = boardService.selectBoardCount();

        PageInfo pi = new PageInfo(boardCount, bpage, 10, 10);
        ArrayList<Board> list = boardService.selectBoardAllList(pi);

        model.addAttribute("list", list);
        model.addAttribute("pi", pi);

        return "erpPage/boardMainPage";
    }


    @GetMapping("enroll.bo")
    public String boardEnroll() {

        return "erpPage/boardEnrollForm";
    }

    @GetMapping("detail.bo")
    public String boardDetail(@RequestParam(value = "bno") int bno, Model model) {
        Board b = boardService.selectDetailView(bno);

        model.addAttribute("b", b);
        return "erpPage/boardDetailView";
    }

    @GetMapping("search.bo")
    public String boardSearch(int bno, Model model) {

        return "";
    }

    @GetMapping("update.bo")
    public String boardUpdate() {
        return "erpPage/boardUpdate";
    }



}
