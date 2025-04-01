package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Job {
    private String job_Code; //직급 코드
    private String job_Name; //직급명
    private int salary; //급여
}
