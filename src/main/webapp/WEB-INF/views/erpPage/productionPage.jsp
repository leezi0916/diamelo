<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/productionPageStyle.css"/>
</head>
<body>
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
                <form action="create.pro" method="post">
                    <div id="header">
                        <div id="header-left">
                            <div id="product">
                                <div id="product-name"><p>*</p>제품명</div>
                                <div id="product-select">
                                    <select id="product-select1">
                                        <option>A제품</option>
                                        <option>B제품</option>
                                        <option>C제품</option>
                                        <option>D제품</option>
                                        <option>E제품</option>
                                        <option>F제품</option>
                                        <option>G제품</option>
                                        <option>H제품</option>
                                        <option>I제품</option>
                                        <option>J제품</option>
                                    </select>
                                </div>
                            </div>
                            <div id="product1">
                                <div id="product-name1">수량</div>
                                <div id="product-amount"><input type="text" placeholder="수량" id="amount-input"></div>
                            </div>
                        </div>

                        <div id="header-right">
                            <div id="product-image">
                                <div id="image"><img></div>
                                <div>제품 이미지</div>
                            </div>
                        </div>
                    </div>
                    <div id="body">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>번호</th>
                                <th>재료명</th>
                                <th>필요 수량(g)</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>5</td>
                                <td>A재료</td>
                                <td>800</td>
                            </tr>
                            <tr>
                                <td>4</td>
                                <td>B재료</td>
                                <td>200</td>
                            </tr>
                            <tr>
                                <td>3</td>
                                <td>C재료</td>
                                <td>300</td>
                            </tr>
                            <tr>
                                <td>2</td>
                                <td>D재료</td>
                                <td>700</td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>E재료</td>
                                <td>500</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div id="footer">
                        <div id="footer-wrap">
                            <button>
                                <svg width="20" height="21" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                    <path d="M10.1542 4.89062V16.1092M4.54492 10.4999H15.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                                </svg>
                                제품 제작
                            </button>
                            <button type="button" onclick="location.href='inv.erp'">재고관리 페이지</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
