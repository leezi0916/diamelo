package com.kh.diamelo.domain.vo;

import lombok.*;

import java.util.ArrayList;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Recipe {
    private int recNo; //레시피 번호
    private int proNo; //제품 번호
    private int matNo; //재료 번호
    private int amount; //제품 조합시 필요 단위(g)

    private String proName; // 재료 이름
    private int priceTotal; // 재료 수량 * 단가
    private ArrayList<Recipe> recipeList;
}
