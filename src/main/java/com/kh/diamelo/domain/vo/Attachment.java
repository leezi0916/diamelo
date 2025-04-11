package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Attachment {

    private int proNo; //제품 번호
    private String userId; //사용자 ID
    private int salNo; //매출 번호
    private String originName; //원본 파일명
    private String changeName; //변경된 파일명

    private Date updateDate; //업로드 일자


}
