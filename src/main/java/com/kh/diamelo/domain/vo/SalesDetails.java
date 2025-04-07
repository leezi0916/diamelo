package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class SalesDetails {

    private int salNo; //매출 번호
    private String userId; //작성자 ID
    private int groupNo; // 그룹번호
    private String proName; //제품 이름
    private String filePath; //제품이미지
    private int salesStock; //제품수량
    private int salesAmount; //금액
    private String type; //분류 지출(O), 소득(I)
    private String salesDate; //판매 / 구매 일자
    private String status; //승인상태 대기 : N, 승인 : Y


//   새로 추가
    private String companyName;
    private int totalSales;
    private String userName;


}

