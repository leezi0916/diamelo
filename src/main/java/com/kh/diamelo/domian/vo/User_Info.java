package com.kh.diamelo.domian.vo;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class User_Info {
    private String user_Id; //아이디
    private String job_Code; //직급 코드 (J1 ~ J6, 거래처는 J0)
    private String dept_Code; //부서 코드 (D1 ~ D5, 거래처는 D0)
    private String user_Pwd; //비밀번호
    private String company_Name; //기업명
    private String user_Name; //이름
    private String phone; //전화번호
    private String email; //이메일
    private String enroll_Date; //가입일
    private String modify_Date; //수정일
    private String status; //승인 상태값(Y / N)
    private String user_Profile; //프로필 경로
}
