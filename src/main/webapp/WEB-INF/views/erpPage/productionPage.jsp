<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/productionPageStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="/js/erp/production.js"></script>
</head>
<body>
<c:if test="${ not empty message}">
    <script>
        alert("${message}");
    </script>
    <c:remove var="alertMsg" scope="session"/>
</c:if>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">

        <jsp:include page="../common/erp/header.jsp"/>

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div class="page-body-header-text">
                    제품 제작
                </div>
            </div>
            <div id="page-body-content">
                <form id="production-form" action="create.pro" method="post">
                    <div id="header">
                        <div id="header-left">
                            <div id="product">
                                <div id="product-name"><p>*</p>제품명</div>
                                <div id="product-select">
                                    <select id="product-select1" name="productNo">
                                        <option value="">제품을 선택하세요</option>
                                        <c:forEach var="product" items="${productList}">
                                            <option value="${product.proNo}">${product.proName}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div id="product1">
                                <div id="product-name1">수량</div>
                                <div id="product-amount">
                                    <input type="number" placeholder="수량" id="amount-input" name="quantity">
                                </div>
                            </div>
                            <div id="product2">
                                <p id="max-count-wrapper" style="display:none; color: blue">제작 가능: <span id="max-count"></span>개</p>
                            </div>


                        </div>

                        <div id="header-right">
                            <div id="product-image">
                                <!-- 제품 이미지 -->
                                <img id="product-img" src="" alt="제품 이미지" style="display:none; width:200px; height:200px;">
                            </div>
                        </div>
                    </div>
                    <div id="body">
                        <!-- 재료 목록 테이블 -->
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>재료 번호</th>
                                <th>재료명</th>
                                <th>필요 수량(g)</th>
                            </tr>
                            </thead>
                            <tbody id="material-list">
                            <tr>
                                <td colspan="3">제품을 선택하면 필요한 재료가 표시됩니다.</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="footer">
                        <div id="footer-wrap">
                            <button type="submit" id="produce-btn">
                                <svg width="20" height="21" viewBox="0 0 20 21" fill="none"
                                     xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.1542 4.89062V16.1092M4.54492 10.4999H15.7635" stroke="white"
                                          stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                제품 제작
                            </button>
                            <button type="button" onclick="location.href='${pageContext.request.contextPath}/inv.erp'">재고관리 페이지</button>


                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>




</body>
</html>
