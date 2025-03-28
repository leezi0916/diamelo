<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/salesDetailPageStyle.css" />

    <style>
        .table td{
            padding-right: 30px;
        }
    </style>
</head>
<body>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp" />

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp" />

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div id="page-body-header-text">
                    판매 내역 상세보기
                </div>
            </div>

            <div class="page-body-content">
                <div id="page-body-content-search-list">

                    <table class="content-table table-hover">
                        <thead>
                        <tr class="page-body-content-th">

                            <th>구매 기업: 올리브영</th>
                            <th></th>
                            <th>총 물품 개수: 290개</th>
                            <th></th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-list">100</td>
                            <td>개</td>
                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/resources/image/productImgae/product2.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-list">100</td>
                            <td>개</td>
                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/resources/image/productImgae/product3.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-list">100</td>
                            <td>개</td>
                        </tr>
                        <tr class="page-body-content-td">
                            <td class="page-body-content-sales-list-img" style="background-image: url('/resources/image/productImgae/product4.png')"></td>
                            <td class="page-body-content-sales-lists">A제품</td>
                            <td class="page-body-content-sales-list">100</td>
                            <td class="page-body-content-sales-list-amount">개</td>
                        </tr>


                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
