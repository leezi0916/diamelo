<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <%-- 공통 레이아웃 및 스타일 css 파일들 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/materialBuyPageStyle.css" />
</head>
<body>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp" />


    <div class="main-area">
        <!-- 오른쪽 상단바 + 콘텐츠 -->
        <jsp:include page="../common/erp/header.jsp" />

        <!-- 페이지 본문 -->
        <div class="page-body">
            <%-- 본문 상단 제목 영역 --%>
            <div class="page-body-header">
                <div id="page-body-header-text">
<%--                    판매 내역 상세보기--%>
                    게시글 보기
                </div>
            </div>
            <%-- 테이블 포함 본문 내용 영역 --%>
            <div class="page-body-content">
                <div id="page-body-content-search-list">

                    <%-- 판매 상세 테이블, hover추가 --%>
                    <table class="content-table table-hover">
                        <thead>
                        <tr class="page-body-content-th">
                            <th><input type="checkbox"></th>
                            <th>품목</th>
                            <th></th>
                            <th>비고</th>
                            <th>구매 단가(그람)</th>
                            <th>발주 수량</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- 각 제품 항목(이미지, 이름, 수량) 5  15% 15% 30% 15% 15%--%>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr><tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr>
                            <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                            <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-material-list-name">히알루론산</td>
                            <td class="page-body-content-material-list-description">가나다라마바사</td>
                            <td class="page-body-content-material-list-capacity">9,330</td>
                            <td class="page-body-content-material-list-amount">10개</td>
                        </tr>
                        <tr id="page-body-content-material-list-last">
                            <td colspan="2">0<span>개</span></td>
                            <td colspan="2"><span>총 수량</span>0</td>
                            <td colspan="2">합계 금액<span>0</span>원</td>
                        </tr>
                        <tr class="page-body-content-material-list-last">
                            <td colspan="2">히알루론산</td>
                            <td colspan="2">수량<span>0</span></td>
                            <td colspan="2"><span></span>원</td>
                        </tr>
                        <tr class="page-body-content-material-list-last">
                            <td colspan="2">정제수</td>
                            <td colspan="2">수량<span>0</span></td>
                            <td colspan="2"><span></span>원</td>
                        </tr>
                        <tr class="page-body-content-material-list-last">
                            <td colspan="2">콜라겐</td>
                            <td colspan="2">수량<span>0</span></td>
                            <td colspan="2"><span></span>원</td>
                        </tr>

                        </tbody>
                    </table>
                </div>
            </div>
<%--             하단 버튼 영역(승인, 반려, 돌아가기)--%>
            <div id="page-body-button-div">

                <button class="searchBtn">
                    <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M7.15422 1.00586V12.2245M1.54492 6.61516H12.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                    구매 신청
                </button>
                <button class="searchBtn">
                    돌아가기
                </button>
            </div>

        </div>
    </div>
</div>
</body>
</html>
