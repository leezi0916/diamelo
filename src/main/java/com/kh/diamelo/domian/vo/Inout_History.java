package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Inout_History {
    private int history_No; //내역 번호
    private int pro_No; //제품 번호
    private String history_Type; //유형 (입고 : O, 출고(판매) : I)
    private int history_Stock; //입출고 수량 - 입고시 단위는 g
    private String history_Date; //처리 일자
    private String history_Status; //승인 상태 (W : 대기, Y : 승인 , N : 반려)
}
