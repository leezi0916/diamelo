package com.kh.diamelo.RESTController;

import com.kh.diamelo.domain.vo.PageInfo;
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
    public String insertReply(Reply r) {
        return boardService.insertReply(r) > 0 ? "success" : "fail";
    }

    @GetMapping("/reply")
    public ArrayList<Reply> getReplyList(int postId) {
        return boardService.selectReplyList(postId);
    }

    @GetMapping("/delete")
    public ArrayList<Reply> getReply(@RequestParam int postId) {
        return boardService.selectReply(postId);
    }

    @PostMapping("/delete")
    public String deleteReply(Reply r) {
        return boardService.deleteReply(r) > 0 ? "success" : "fail";
    }

}
