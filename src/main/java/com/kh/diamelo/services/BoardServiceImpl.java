package com.kh.diamelo.services;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.PageInfo;
import com.kh.diamelo.domain.vo.Reply;
import com.kh.diamelo.mappers.BoardMapper;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.RowBounds;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@RequiredArgsConstructor
@Service
public class BoardServiceImpl implements BoardService {
    private final BoardMapper boardMapper;

    //모든 게시판 수
    @Override
    public int selectBoardAllCount() {
        return boardMapper.selectBoardAllCount();
    }

    //모든 게시판 검색
    @Override
    public ArrayList<Board> selectBoardAllList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getBoardLimit());
        return boardMapper.selectBoardAllList(rowBounds);
    }

    //게시판 작성
    @Override
    public int insertBoard(Board board) {
        return boardMapper.insertBoard(board);
    }

    //게시판 보기
    @Override
    public Board selectDetailView(int bno) {
        return boardMapper.selectDetailView(bno);
    }

    //댓글 추가
    @Override
    public int insertReply(Reply r) {
        return boardMapper.insertReply(r);
    }

    //해당 게시판 번호의 댓글 가져오기
    @Override
    public ArrayList<Reply> selectReplyList(int postId) {
        return boardMapper.selectReplyList(postId);
    }

    //게시판 수정
    @Override
    public int updateBoard(Board board) {
        return boardMapper.updateBoard(board);
    }

    //게시판 삭제
    @Override
    public int deleteBoard(Board board) {
        return boardMapper.deleteBoard(board);
    }

    //게시판 조건으로 검색 후 게시판 수
    @Override
    public int selectBoardCount(int type, String title, String userId) {
        return boardMapper.selectBoardCount(type, title, userId);
    }

    //게시판 조건으로 검색
    @Override
    public ArrayList<Board> selectBoard(int type, String title, String userId, Board board, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getBoardLimit());
        return boardMapper.selectBoard(type, title, userId, board, rowBounds);
    }

    //게시판 댓글 검색
    @Override
    public ArrayList<Reply> selectReply(int postId) {
        return boardMapper.selectReply(postId);
    }

    //게시판 댓글 삭제
    @Override
    public int deleteReply(Reply r) {
        return boardMapper.deleteReply(r);
    }
}
