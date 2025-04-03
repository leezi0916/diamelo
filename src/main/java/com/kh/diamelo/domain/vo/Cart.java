package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Cart {

    private int proNo; //제품 번호
    private String userId; //유저 ID
    private int proStock; //상품 구매 수량

}
