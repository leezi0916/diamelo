package com.kh.diamelo.domain.vo;


import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PageInfo {
    //--------------------- 페이징 처리 ---------------------------------
    private int listCount; // 현재 총 게시글 수
    private int currentPage; // 현재 페이지(사용자가 요청한 페이지)
    private int pageLimit; // 하단의 보여질 페이징바의 수
    private int boardLimit ; // 한 페이지내에 보여질 게시글 최대 수
    // 위 4개의 값을 기준으로 아래 3개의 값을 계산

    private int maxPage; // 가장 마지막 페이지(총 페이지수)
    private int startPage; // 하단에 보여질 페이징바의 시작 수
    private int endPage; // 하단의 보여질 페이징바의 끝 수

    public PageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
        super();
        this.listCount = listCount;
        this.currentPage = currentPage;
        this.pageLimit = pageLimit;
        this.boardLimit = boardLimit;

        /**
         * maxPage : 제일 마지막 페이지수 -> 총 몇페이지 나오는지
         *
         * listCount    boardLimit
         *     22           10      -> 3
         *    100           10     -> 10
         *    107           10     -> 11
         * 총 게시글 수 / 한 페이지에 보여줄 게시글 수 -> 올림
         *
         */
        maxPage = (int)Math.ceil((double) listCount / boardLimit);

        /**
         * startPage : 페이징 바 시작 수
         *
         * currentPage   pageLimit    startPage
         *     1            10            1
         *     5            10            1
         *     11           10            11
         *
         * startPage = (((currentPage -1) / pageLimit) * pageLimit + 1)
         */
        startPage = (((currentPage - 1) / pageLimit) * pageLimit + 1);

        /**
         * endPage : 페이징바 끝 수
         *
         * startPage : 1 -> 10
         * startPage : 11 -> 20
         * startPage : 21 -> 30
         */

        endPage = startPage + pageLimit - 1;

        //startPage가 11이면 endPage가 20이다. (maxPage 13이라면?)
        // 게시글 225개
        // maxPage - 23페이지 나옴 -> 전체 게시글 / 현재 페이에 몇개 띄우기 가능인지 -> 225 / 10 -> 22.5 올림 -> 23 페이지
        // startPage - ((현재 페이지 - 1) /  정해진 페이지바 개수(10개)) * 페이지바 개수 + 1 -> 1~10 -> 1이 시작 페이지바 , 11~20 -> 11이 시작 페이지바
        // endPage - 현재 시작 페이지바 수 + 정해진 페이지바 개수 - 1 -> 1~10 -> 10 , 11~20 -> 20 페이지
        // 만약 끝 페이지가 전체 페이지보다 크면 안되기 떄문에
        // ex) 전체 페이지가 5인데 끝 페이지는 10이 되기떄문에
        // 아래처럼 해야함
        endPage = endPage > maxPage ? maxPage : endPage;
    }
}
