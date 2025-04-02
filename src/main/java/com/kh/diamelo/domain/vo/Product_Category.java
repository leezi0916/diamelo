package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Product_Category {
    private int procategory_No; //제품 카테고리 번호
    private String pro_Category; //제품 카테고리명 (화장품 종류)
}
