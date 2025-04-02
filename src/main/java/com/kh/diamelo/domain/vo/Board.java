package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Board {
    private int post_Id; //게시글 번호
    private String user_Id; //작성자 ID
    private String title; //제목
    private String content; //내용
    private String created_Date; //작성일자
    private String update_Date; //수정일자
    private int type; //게시판 유형 공지사항(1) 문의사항(2)
    private String board_Deleted; //삭제됨 Y, 삭제안됨 N
}
