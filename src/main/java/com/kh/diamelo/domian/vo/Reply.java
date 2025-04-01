package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Reply {
    private int rep_No; //댓글 번호
    private int post_Id; //게시글 번호
    private String content; //내용
    private String writer; //작성자
    private String created_Date; //작성일자
    private String update_Date; //수정일자
    private String reply_Deleted; //삭제됨 Y, 삭제안됨 N
}
