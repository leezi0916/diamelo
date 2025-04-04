package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Material {
    private int materialNo; //재료 번호
    private String matName; //재료명
    private int matStock; //재고량
    private String matDetail; //상세 정보
    private int matPrice; //단가
    private String thumbnail; //재료 사진
}
