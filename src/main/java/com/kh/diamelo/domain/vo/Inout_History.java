package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Inout_History {
<<<<<<< HEAD
    private int history_No; //내역 번호
    private int pro_No; //제품 번호
    private String history_Type; //유형 (입고 : O, 출고(판매) : I)
    private int history_Stock; //입출고 수량 - 입고시 단위는 g
    private String history_Date; //처리 일자
    private String history_Status; //승인 상태 (W : 대기, Y : 승인 , N : 반려)
=======
    private int historyNo; //내역 번호
    private int proNo; //제품 번호
    private String history_ype; //유형 (입고 : O, 출고(판매) : I)
    private int historyStock; //입출고 수량 - 입고시 단위는 g
    private String historyDate; //처리 일자
    private String historyStatus; //승인 상태 (W : 대기, Y : 승인 , N : 반려)
>>>>>>> e6ade325249dd104432e510b94c3200068a26bca
}
