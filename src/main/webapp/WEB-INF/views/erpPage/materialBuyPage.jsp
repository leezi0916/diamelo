
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Diamelo</title>
    <%-- 공통 레이아웃 및 스타일 css 파일들 --%>

    <link rel="stylesheet" href="/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="/css/default.css" />
    <link rel="stylesheet" href="/css/erp/materialBuyPageStyle.css" />

</head>
<body>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <div class="main-area">
        <!-- 오른쪽 상단바 + 콘텐츠 -->
        <jsp:include page="../common/erp/header.jsp"/>

        <form action="mat.buy" method="post">
            <!-- 페이지 본문 -->
            <div class="page-body">
                <!-- 본문 상단 제목 영역 -->
                <div class="page-body-header">
                    <div id="page-body-header-text">
                        구매 내역 상세보기
                    </div>
                </div>
                <!-- 테이블 포함 본문 내용 영역 -->
                <div class="page-body-content">

                    <!-- 숨겨진 입력 필드 추가 -->
                    <input type="hidden" id="hiddenItemsCount" name="itemsCount" value="0">
                    <input type="hidden" id="hiddenTotalQty" name="totalQty" value="0">
                    <input type="hidden" id="hiddenTotalPrice" name="totalPrice" value="0">
                    <input type="hidden" id="hiddenOrderDetails" name="orderDetails" value="">
                    <div id="page-body-content-search-list">
                        <table class="content-table table-hover">
                            <thead>
                            <tr class="page-body-content-th">
                                <th>품목</th>
                                <th></th>
                                <th>비고</th>
                                <th>구매 단가(그람)</th>
                                <th>발주 수량</th>
                            </tr>
                            </thead>
                            <!-- 제품 목록과 요약 영역을 포함한 tbody -->
                            <tbody id="product-body" >
                            <c:forEach var="m" items="${list}">
                                <tr>
                                    <td class="page-body-content-material-list-img"
                                        style="background-image: url('${m.changeName}')"></td>
                                    <td class="page-body-content-material-list-name">${m.proName}</td>
                                    <td class="page-body-content-material-list-description">${m.proDetail}</td>
                                    <td class="page-body-content-material-list-capacity">${m.proPrice}</td>
                                    <td>
                                        <input type="number"
                                               class="input-box order-input"
                                               data-proNo="${m.proNo}"
                                               data-name="${m.proName}"
                                               data-price="${m.proPrice}"
                                               min="0"
                                               value="0" />
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr id="page-body-content-material-list-last">
                                <td colspan="2"><span id="itemsCount"></span>개</td>
                                <td colspan="2">총 수량 <span id="totalQty"></span></td>
                                <td colspan="2">합계 금액 <span id="totalPrice">0</span>원</td>
                            </tr>
                            </tbody>
                            <!-- 동적 상세 항목을 위한 tbody (수량이 0 이상인 항목에 대해 JS가 <tr> 생성) -->
                            <tbody id="order-details">
                            <!-- JS에서 <tr> 태그들이 추가됩니다. -->
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- 하단 버튼 영역(승인, 반려, 돌아가기) -->
                <div id="page-body-button-div">
                    <button class="searchBtn" onclick="location.href='buyList.erp'">
                        <svg width="14" height="14" viewBox="0 0 14 14" fill="none"
                             xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.15422 1.00586V12.2245M1.54492 6.61516H12.7635" stroke="white"
                                  stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                        </svg>
                        구매 신청
                    </button>
                    <button class="searchBtn" type="button" onclick="location.href='buyList.erp'">
                        돌아가기
                    </button>
                </div>
            </div>

        </form>
    </div>
</div>
<script src="/js/erp/materialBuyPage.js"></script>
</body>
</html>
