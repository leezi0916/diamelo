package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Recipe {
    private int proNo; //제품 번호
    private int matNo; //재료 번호
    private int amount; //제품 조합시 필요 단위(g)
}
