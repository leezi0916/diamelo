package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Product_Inventory {
    private int proInvenNo; //제품 재고 번호
    private int proNo; //제품 번호
    private int proInventStock; //제품 재고 수량
}
