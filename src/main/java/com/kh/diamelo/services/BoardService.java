package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import org.apache.ibatis.annotations.Param;

import java.util.ArrayList;

public interface BoardService {
    //모든 게시판 수
    int selectBoardAllCount();

    //모든 게시판 검색
    ArrayList<Board> selectBoardAllList(PageInfo pi);

    //게시판 작성
    int insertBoard(Board board);

    //게시판 보기
    Board selectDetailView(int bno);

    //댓글 추가
    int insertReply(Reply r);

    //해당 게시판 번호의 댓글 가져오기
    ArrayList<Reply> selectReplyList(int postId);

    //게시판 수정
    int updateBoard(Board board);

    //게시판 삭제
    int deleteBoard(Board board);

    //게시판 조건으로 검색 후 게시판 수
    int selectBoardCount(int type, String title, String userId);

    //게시판 조건으로 검색
    ArrayList<Board> selectBoard(int type, String title, String userId,Board board ,PageInfo pi);

    //게시판 댓글 검색
    ArrayList<Reply> selectReply(int postId);

    //게시판 댓글 삭제
    int deleteReply(Reply r);
}
