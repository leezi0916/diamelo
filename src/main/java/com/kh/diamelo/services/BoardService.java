package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BoardService {
    int selectBoardCount();
    ArrayList<Board> selectBoardAllList(PageInfo pi);

    int insertBoard(Board board);

    Board selectDetailView(int bno);

    int insertReply(Reply r);
    ArrayList<Reply> selectReplyList(int postId);

    int updateBoard(Board board);
    int deleteBoard(Board board);

    ArrayList<Board> selectBoard(int type, String title, String userId,Board board ,PageInfo pi);
}
