package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Product {
    private int proNo; //제품번호
    private int proCategoryNo; //제품 카테고리 번호
    private String proName; //제품명
    private String proDetail; //제품 상세 정보
    private int proPrice; //단가
    private String proDeleted; //삭제됨 Y, 삭제안됨 N
    private String isProduct; //완제품 여부(제품 : Y, 재료 : N)

    private int amount;

    private int stock;

    private String originName;
    private String changeName;

}
