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

    //댓글 추가
    int insertReply(Reply r);
    //해당 게시판 번호의 댓글 가져오기
    ArrayList<Reply> selectReplyList(@Param("postId")int postId);

    int updateBoard(Board board);
}
