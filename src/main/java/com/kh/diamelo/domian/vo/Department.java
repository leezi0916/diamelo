package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Department {
    private String dept_Code; //부서 코드
    private String dept_Name; //부서명
    private String dept_Phone; //부서 전화번호
}
