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
    private String salesDate; //판매 / 구매 일자
    private int salesAmount; //금액
    private String type; //분류 지출(O), 소득(I)
    private String status; //승인상태 대기 : N, 승인 : Y
    private String salesName; //제품 이름

}
