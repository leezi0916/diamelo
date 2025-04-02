package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BoardService {
    int selectBoardCount();
    ArrayList<Board> selectBoardAllList(PageInfo pi);
    Board selectDetailView(int bno);
    ArrayList<Reply> selectReplyView(int bno);
    int insertReply(Reply r);
    ArrayList<Reply> selectReplyList(int boardNo);
}
