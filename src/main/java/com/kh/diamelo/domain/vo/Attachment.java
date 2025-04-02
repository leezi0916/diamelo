package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Attachment {
<<<<<<< HEAD
    private int pro_No; //제품 번호
    private String user_Id; //사용자 ID
    private int sal_No; //매출 번호
    private String origin_Name; //원본 파일명
    private String change_Name; //변경된 파일명
    private String file_Path; //저장된 파일 경로
    private Date update_Date; //업로드 일자
=======
    private int proNo; //제품 번호
    private String userId; //사용자 ID
    private int salNo; //매출 번호
    private String originName; //원본 파일명
    private String changeName; //변경된 파일명
    private String filePath; //저장된 파일 경로
    private Date updateDate; //업로드 일자
>>>>>>> e6ade325249dd104432e510b94c3200068a26bca
}
