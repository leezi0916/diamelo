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

    @Override
    public int selectBoardCount() {
        return boardMapper.selectBoardCount();
    }

    @Override
    public ArrayList<Board> selectBoardAllList(PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getBoardLimit());
        return boardMapper.selectBoardAllList(rowBounds);
    }

    @Override
    public int insertBoard(Board board) {
        return boardMapper.insertBoard(board);
    }

    @Override
    public Board selectDetailView(int bno) {
        return boardMapper.selectDetailView(bno);
    }


    @Override
    public int insertReply(Reply r) {
        return boardMapper.insertReply(r);
    }

    @Override
    public ArrayList<Reply> selectReplyList(int postId) {
        return boardMapper.selectReplyList(postId);
    }

    @Override
    public int updateBoard(Board board) {
        return boardMapper.updateBoard(board);
    }

    @Override
    public int deleteBoard(Board board) {
        return boardMapper.deleteBoard(board);
    }

    @Override
    public ArrayList<Board> selectBoard(int type, String title, String userId, Board board, PageInfo pi) {
        int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
        RowBounds rowBounds = new RowBounds (offset, pi.getBoardLimit());


        return boardMapper.selectBoard(type, title, userId, board, rowBounds);
    }
}
