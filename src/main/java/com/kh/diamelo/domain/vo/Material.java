package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Material {
    private int material_No; //재료 번호
    private String mat_Name; //재료명
    private int mat_Stock; //재고량
    private String mat_Detail; //상세 정보
    private int mat_Price; //단가
    private String thumbnail; //재료 사진
}
