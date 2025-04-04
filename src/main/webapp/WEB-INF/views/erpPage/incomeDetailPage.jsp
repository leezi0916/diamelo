<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <%-- 공통 레이아웃 및 스타일 css 파일들 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/incomeDetailPageStyle.css" />
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
                    매출 내역 상세보기
                </div>
            </div>
                <%-- 테이블 포함 본문 내용 영역 --%>
                <div class="page-body-content">
                <div id="page-body-content-search-list">

                    <%-- 판매 상세 테이블, hover추가 --%>
                    <table class="content-table table-hover">
                        <thead>
                        <tr class="page-body-content-th">
                            <th>거래처: 올리브영</th>
                            <th></th>
                            <th colspan="2">총 매출금액: 2,900,000 원</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- 각 제품 항목(이미지, 이름, 수량) --%>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-lists">10개</td>
                            <td class="page-body-content-sales-list" >1,000,000원</td>

                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/image/productImgae/product2.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-lists">10개</td>
                            <td class="page-body-content-sales-list" >1,000,000원</td>

                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/image/productImgae/product3.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-lists">10개</td>
                            <td class="page-body-content-sales-list" >1,000,000원</td>

                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/image/productImgae/product4.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-lists">10개</td>
                            <td class="page-body-content-sales-list" >1,000,000원</td>
                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/image/productImgae/product4.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-lists">10개</td>
                            <td class="page-body-content-sales-list" >1,000,000원</td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
                <%-- 하단 버튼 영역(승인, 반려, 돌아가기) --%>
                <div id="page-body-button-div">

                <button class="searchBtn" onclick="location.href='income.erp'">
                    돌아가기
                </button>
            </div>
        </div>
    </div>
</div>
</body>
</html>
