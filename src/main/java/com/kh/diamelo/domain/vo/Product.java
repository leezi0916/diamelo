package com.kh.diamelo.domain.vo;

import lombok.*;

import java.sql.Date;

@Getter
@Setter
@AllArgsConstructor
@ToString
@NoArgsConstructor
public class Product {
    private int proNo; //제품번호
    private int proCategoryNo; //제품 카테고리 번호
    private String proName; //제품명
    private String proDetail; //제품 상세 정보
    private int proPrice; //단가
    private String proDeleted; //삭제됨 Y, 삭제안됨 N
    private String isProduct; //완제품 여부(제품 : Y, 재료 : N)
    private String userName;

    private int proInventStock;
    private String categoryName;

    private String changeName;
    private String originName;
    //private int rNum;
    private String filePath;
    private String productProfile;

    private Date proEnrollDate;

    private int amount;


    private int historyNo;
    private int groupNo;
    private int historyStock;

    private int qty;
    private int itemTotal;
    private String groupType;
    private String groupDate;
    private String groupStatus;


}
