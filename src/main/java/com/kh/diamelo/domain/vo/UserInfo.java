package com.kh.diamelo.domain.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class UserInfo {
    private String userId; //아이디
    private String jobCode; //직급 코드 (J1 ~ J6, 거래처는 J0)
    private String deptCode; //부서 코드 (D1 ~ D5, 거래처는 D0)
    private String userPwd; //비밀번호
    private String companyName; //기업명
    private String userName; //이름
    private String phone; //전화번호
    private String email; //이메일
    private String enrollDate; //가입일
    private String modifyDate; //수정일
    private String status; //승인 상태값(Y / N)
    private String userDeleted; // 삭제 상태값(Y / N)

    private String jobName;
    private String deptName;
    private String salary;
    private int rNum;

    private String originName;
    private String changeName;
    private String filePath;
    private String userProfile; //프로필 경로
}