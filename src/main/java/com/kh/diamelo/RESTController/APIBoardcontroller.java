package com.kh.diamelo.RESTController;

import com.kh.diamelo.domain.vo.Reply;
import com.kh.diamelo.services.BoardService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/board")
public class APIBoardcontroller {
    private final BoardService boardService;

    @PostMapping("/reply")
    public String insertReply( Reply r) {
        return boardService.insertReply(r) > 0 ? "success" : "fail";
    }

    @GetMapping("/reply")
    public ArrayList<Reply> getReplyList(int boardNo) {
        return boardService.selectReplyList(boardNo);
    }
}
