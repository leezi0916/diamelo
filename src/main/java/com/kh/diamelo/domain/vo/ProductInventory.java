package com.kh.diamelo.domain.vo;

import lombok.*;

import java.math.BigDecimal;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class ProductInventory {
    private int proInvenNo; //제품 재고 번호
    private int proNo; //제품 번호
//    private BigDecimal proInventStock; //제품 재고 수량
    private int proInventStock;

}
