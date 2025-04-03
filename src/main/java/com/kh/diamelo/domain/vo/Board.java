package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Board {

    private int postId; //게시글 번호
    private String userId; //작성자 ID
    private String title; //제목
    private String content; //내용
    private String createdDate; //작성일자
    private String updateDate; //수정일자
    private int type; //게시판 유형 공지사항(1) 문의사항(2)
    private String boardDeleted; //삭제됨 Y, 삭제안됨 N

}
