package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Product {
    private int pro_No; //제품번호
    private int procategory_No; //제품 카테고리 번호
    private String pro_Name; //제품명
    private String pro_Detail; //제품 상세 정보
    private int pro_Price; //단가
    private String pro_Deleted; //삭제됨 Y, 삭제안됨 N
    private String is_Product; //완제품 여부(제품 : Y, 재료 : N)
}
