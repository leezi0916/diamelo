package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Reply {
    private int repNo; //댓글 번호
    private int postId; //게시글 번호
    private String content; //내용
    private String writer; //작성자
    private String createdDate; //작성일자
    private String updateDate; //수정일자
    private String replyDeleted; //삭제됨 Y, 삭제안됨 N
}
