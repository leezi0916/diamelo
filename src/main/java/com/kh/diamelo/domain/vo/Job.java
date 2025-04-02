package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Job {
    private String jobCode; //직급 코드
    private String jobName; //직급명
    private int salary; //급여
}
