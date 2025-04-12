package com.kh.diamelo.controller;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import com.kh.diamelo.services.BoardService;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;

@RequiredArgsConstructor
@Controller
public class BoardController {

    private final BoardService boardService;
    // 게시판관리 페이지로 가기
    @GetMapping("board.erp")
    public String board(@RequestParam(defaultValue = "1")int bpage, Model model,HttpSession session) {
        String svg = "/image/erpIcon/boardIcon.png";
        
        int boardCount = boardService.selectBoardAllCount();

        PageInfo pi = new PageInfo(boardCount, bpage, 10, 10);
        ArrayList<Board> list1 = boardService.selectBoardAllList(pi);

        model.addAttribute("list1", list1);
        model.addAttribute("pi", pi);

        session.setAttribute("selectIcon", svg);
        session.setAttribute("seletTitle", "게시판");

        return "erpPage/boardMainPage";
    }

    //게시판 작성 페이지로 가기
    @GetMapping("enrollForm.bo")
    public String boardEnrollForm() {

        return "erpPage/boardEnrollForm";
    }

    //게시판 작성
    @PostMapping("insertBoard.bo")
    public String boardInsert(Board board, HttpSession session, Model model) {
        int boardInsert = boardService.insertBoard(board);


        if(boardInsert > 0) {
            session.setAttribute("alertMsg", "게시판 작성 성공");
            return "redirect:/board.erp";
        }else{
            model.addAttribute("errorMsg","게시판 작성 실패");
            return "common/erp/erpErrorPage";
        }

    }
    
    //게시판 자세히 보기 페이지 가기
    @GetMapping("detail.bo")
    public String boardDetail(@RequestParam(value = "bno") int bno, Model model) {
        Board b = boardService.selectDetailView(bno);

        model.addAttribute("b", b);
        return "erpPage/boardDetailView";
    }
    
    //게시판 번호에 맞춰 게시판 수정 페이지에 가기
    @GetMapping("updateForm.bo")
    public String boardUpdateForm(@RequestParam(value = "bno") int bno, Model model) {
        Board b1 = boardService.selectDetailView(bno);

        model.addAttribute("b1", b1);
        return "erpPage/boardUpdate";
    }

    //게시판 수정
    @GetMapping("update.bo")
    public String boardUpdate(Model model,Board board, HttpSession session) {
        int boardUpdate = boardService.updateBoard(board);

        if(boardUpdate > 0) {
            session.setAttribute("alertMsg", "게시판 수정 성공");
            return "redirect:/detail.bo?bno=" + board.getPostId();
        }else {
            model.addAttribute("errorMsg", "게시판 수정 실패");
            return "common/erp/erpErrorPage";
        }
    }
    
    //게시판 삭제
    @GetMapping("delete.bo")
    public String boardDelete(Model model, Board board, HttpSession session) {
        int boardDelete = boardService.deleteBoard(board);

        if(boardDelete > 0) {
            session.setAttribute("alertMsg","게시판 삭제 성공");
            return "redirect:/board.erp";
        }else{
            model.addAttribute("errorMsg", "게시판 삭제 실패");
            return "common/erp/erpErrorPage";
        }
    }

    //게시판 조건으로 검색
    @GetMapping("select.bo")
    public String boardSelect(@RequestParam(defaultValue = "1")int bpage, Model model, Board board
            ,@RequestParam(value="type")int type, @RequestParam(value = "title")String title, @RequestParam(value = "userId")String userId) {
        int boardCount = boardService.selectBoardCount(type, title, userId);

        PageInfo pi = new PageInfo(boardCount, bpage, 10, 10);
        ArrayList<Board> list1 = boardService.selectBoard(type, title, userId, board,pi);

        model.addAttribute("list1", list1);
        model.addAttribute("pi", pi);

        model.addAttribute("type", type);
        model.addAttribute("title", title);
        model.addAttribute("userId", userId);

        return "erpPage/boardMainPage";
    }
}
