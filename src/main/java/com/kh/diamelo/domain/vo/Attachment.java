package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Attachment {
    private int pro_No; //제품 번호
    private String user_Id; //사용자 ID
    private int sal_No; //매출 번호
    private String origin_Name; //원본 파일명
    private String change_Name; //변경된 파일명
    private String file_Path; //저장된 파일 경로
    private Date update_Date; //업로드 일자
}
