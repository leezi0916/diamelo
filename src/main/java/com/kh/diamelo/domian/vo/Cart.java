package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Cart {
    private int pro_No; //제품 번호
    private String user_Id; //유저 ID
    private int pro_Stock; //상품 구매 수량
}
