package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Sales_Details {
<<<<<<< HEAD
    private int sal_No; //매출 번호
    private String user_Id; //작성자 ID
    private String sales_Date; //판매 / 구매 일자
    private int sales_Amount; //금액
    private String type; //분류 지출(O), 소득(I)
    private String status; //승인상태 대기 : N, 승인 : Y
    private String sales_Name; //제품 이름
=======
    private int salNo; //매출 번호
    private String userId; //작성자 ID
    private String salesDate; //판매 / 구매 일자
    private int salesAmount; //금액
    private String type; //분류 지출(O), 소득(I)
    private String status; //승인상태 대기 : N, 승인 : Y
    private String salesName; //제품 이름
>>>>>>> e6ade325249dd104432e510b94c3200068a26bca
}
