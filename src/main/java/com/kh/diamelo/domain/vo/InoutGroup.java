package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class InoutGroup {
    private int groupNo;
    private String userId;
    private String groupType;
    private String groupDate;
    private String groupStatus;

    private int salesAmount; //금액


    private String companyName;
    private String userName;
    private String proName;
}
