package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Sales {
    private int salNo; //매출 번호
    private String userId; //작성자 ID
    private String salesDate; //판매 / 구매 일자
    private int salesAmount; //금액
    private String type; //지출 (O), 소득 (I)
    private String status; //승인상태
    private String salesName; //내역명

}
