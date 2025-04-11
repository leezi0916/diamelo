package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor

public class InoutHistory {
    private int historyNo; //내역 번호
    private int proNo; //제품 번호

    private int groupNo;
    private int historyStock; //입출고 수량 - 입고시 단위는 g
    private int historyPrice; // 제품별 총 가격

}
