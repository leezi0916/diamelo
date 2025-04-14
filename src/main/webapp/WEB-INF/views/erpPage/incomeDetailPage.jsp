<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
                    <c:choose>
                        <c:when test="${list[0].type eq 'I'}">소득</c:when>
                        <c:otherwise>지출</c:otherwise>
                    </c:choose>
                    내역 상세보기
                </div>
            </div>
                <%-- 테이블 포함 본문 내용 영역 --%>
                <div class="page-body-content">
                <div id="page-body-content-search-list">

                    <%-- 판매 상세 테이블, hover추가 --%>
                    <table class="content-table table-hover">
                        <thead>
                        <tr class="page-body-content-th">
                            <th>거래처: <c:out value="${list[0].companyName}" default="A공장" /></th>
                            <th></th>
                            <th colspan="2">총 매출금액: <span style="font-weight: 500; color: ${list[0].type eq 'I' ? 'blue' : 'red'};">
                        <c:choose>
                            <c:when test="${list[0].type eq 'I'}">
                                +<fmt:formatNumber value="${list[0].totalSales}" type="number"/>
                            </c:when>
                            <c:otherwise>
                                -<fmt:formatNumber value="${list[0].totalSales}" type="number"/>
                            </c:otherwise>
                        </c:choose>
                    </span> 원</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%-- 각 제품 항목(이미지, 이름, 수량) --%>
                        <c:forEach var="item" items="${list}">
                            <tr>
                                <td><div id="product-img"><img src="${item.changeName}" alt="제품 이미지"></div></td>
                                <td>${item.proName}</td>
                                <td>${item.salesStock}</td>
                                <td><fmt:formatNumber value="${item.salesAmount}" type="number"/> 원</td>
                            </tr>
                        </c:forEach>
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
