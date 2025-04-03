package com.kh.diamelo.mappers;

import com.kh.diamelo.domain.vo.Board;
import com.kh.diamelo.domain.vo.Reply;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import java.util.ArrayList;

@Mapper
public interface BoardMapper {
    int selectBoardCount();
    ArrayList<Board> selectBoardAllList(RowBounds rowBounds);
    Board selectDetailView(@Param("bno") int bno);
    ArrayList<Reply> selectReplyView(@Param("bno") int bno);
    int insertReply(Reply r);
    ArrayList<Reply> selectReplyList(@Param("boardNo")int boardNo);
}
