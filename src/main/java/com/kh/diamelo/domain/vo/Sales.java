package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Sales {
    private int sal_No; //매출 번호
    private String user_Id; //작성자 ID
    private String sales_Date; //판매 / 구매 일자
    private int sales_Amount; //금액
    private String type; //지출 (O), 소득 (I)
    private String status; //승인상태
    private String sales_Name; //내역명
}
