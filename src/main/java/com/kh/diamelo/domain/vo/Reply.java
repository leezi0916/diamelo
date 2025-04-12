package com.kh.diamelo.domain.vo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Reply {

    @JsonProperty("reply_no")
    private int repNo; //댓글 번호
    @JsonProperty("post_id")
    private int postId; //게시글 번호
    @JsonProperty("reply_content")
    private String content; //내용
    @JsonProperty("user_id")
    private String writer; //작성자
    @JsonProperty("create_date")
    private String createDate; //작성일자

    private String updateDate; //수정일자

    private String replyDeleted; //삭제됨 Y, 삭제안됨 N

}
