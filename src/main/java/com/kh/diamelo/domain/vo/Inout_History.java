package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Inout_History {

    private int historyNo; //내역 번호
    private int proNo; //제품 번호
    private String history_ype; //유형 (입고 : O, 출고(판매) : I)
    private int historyStock; //입출고 수량 - 입고시 단위는 g
    private String historyDate; //처리 일자
    private String historyStatus; //승인 상태 (W : 대기, Y : 승인 , N : 반려)

}
