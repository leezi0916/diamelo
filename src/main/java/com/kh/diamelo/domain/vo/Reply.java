package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Reply {
<<<<<<< HEAD
    private int rep_No; //댓글 번호
    private int post_Id; //게시글 번호
    private String content; //내용
    private String writer; //작성자
    private String created_Date; //작성일자
    private String update_Date; //수정일자
    private String reply_Deleted; //삭제됨 Y, 삭제안됨 N
=======
    private int repNo; //댓글 번호
    private int postId; //게시글 번호
    private String content; //내용
    private String writer; //작성자
    private String createdDate; //작성일자
    private String updateDate; //수정일자
    private String replyDeleted; //삭제됨 Y, 삭제안됨 N
>>>>>>> e6ade325249dd104432e510b94c3200068a26bca
}
