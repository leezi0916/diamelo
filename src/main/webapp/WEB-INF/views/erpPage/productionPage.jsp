<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/productionPageStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css"/>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <form action="create.pro" method="post" enctype="multipart/form-data">
                    <div id="header">
                        <div id="header-left">
                            <div id="product">
                                <div id="product-name"><p>*</p>제품명</div>
                                <div id="product-select">
                                    <select id="product-select1">
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
                                    <input type="text" placeholder="수량" id="amount-input" name="quantity">
                                </div>
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
                            <button type="submit">
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

<script>
    $(document).ready(function() {
        $("#product-select1").change(function() {
            let selectedProductNo = $(this).val();

            if (selectedProductNo) {
                // AJAX 요청: 제품의 이미지 및 레시피 가져오기
                $.ajax({
                    url: "/products/details",
                    method: "GET",
                    data: { productNo: selectedProductNo },
                    success: function(response) {
                        let materialList = response.materials; // 재료 목록
                        let imagePath = response.imagePath; // 제품 이미지
                        let materialTableBody = $("#material-list");

                        // ✅ 제품 이미지 업데이트
                        if (imagePath) {
                            $("#product-img").attr("src", imagePath).show();
                        } else {
                            $("#product-img").hide();
                        }

                        // ✅ 기존 테이블 내용 초기화
                        materialTableBody.empty();

                        // ✅ 재료가 없을 경우
                        if (materialList.length === 0) {
                            materialTableBody.append("<tr><td colspan='3'>등록된 레시피가 없습니다.</td></tr>");
                            return;
                        }

                        // ✅ 새로운 데이터 추가
                        materialList.forEach(function(material) {
                            let row = `
                            <tr>
                                <td>${material.matNo}</td>
                                <td>${material.materialName}</td>
                                <td>${material.amount} g</td>
                            </tr>`;
                            materialTableBody.append(row);
                        });
                    },
                    error: function() {
                        alert("레시피 정보를 불러오는 데 실패했습니다.");
                    }
                });
            } else {
                // 제품이 선택되지 않으면 기본 메시지 표시
                $("#material-list").html('<tr><td colspan="3">제품을 선택하면 필요한 재료가 표시됩니다.</td></tr>');
                $("#product-img").hide();
            }
        });
    });
</script>
</body>
</html>
