<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/productionPageStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css"/>
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

<script>
    <%--첫 로딩시 --%>
    $(document).ready(function() {
        // 처음 로딩 시 수량 입력 필드를 비활성화
        $("#amount-input").prop("readonly", true);

        $("#product-select1").change(function() {
            let selectedProductNo = $(this).val();
            $("#amount-input").val(''); // 수량 초기화

            if (selectedProductNo) {
                $("#amount-input").prop("readonly", false); // 제품 선택 시 입력 가능
            } else {
                $("#amount-input").prop("readonly", true); // 제품 선택 안 하면 다시 비활성화
            }
        });
    });

    <%--  ----------------  select 누를시 제품의 맞는 이미지와 레시피 재료정보---------------------------%>
    $(document).ready(function() {
        $("#product-select1").change(function() {
            let selectedProductNo = $(this).val();

            // 수량 입력 필드 초기화
            $("#amount-input").val('');

            if (selectedProductNo) {
                $.ajax({
                    url: "/api/production/details",
                    method: "GET",
                    data: { productNo: selectedProductNo },
                    success: function(response) {
                        console.log(response); // 응답 데이터 확인
                        let materialList = response.materials; // 재료 목록
                        let imagePath = response.imagePath; // 제품 이미지
                        let materialTableBody = $("#material-list");

                        // 제품 이미지 업데이트
                        if (imagePath) {
                            $("#product-img").attr("src", imagePath).show();
                        } else {
                            $("#product-img").hide();
                        }

                        // 기존 테이블 초기화
                        materialTableBody.empty();

                        // 재료가 없을 경우
                        if (materialList.length === 0) {
                            materialTableBody.append("<tr><td colspan='3'>등록된 레시피가 없습니다.</td></tr>");
                            return;
                        }
                        console.log(materialList);


                        //  새로운 데이터 추가
                        materialList.forEach(function(material) {
                            console.log(material); // 각 재료 데이터가 정상적으로 출력되는지 확인

                            let row = "<tr>" +
                                            "<td>" + material.proNo  + "</td>" +
                                            "<td>" + material.proName  + "</td>" +
                                            "<td>" + (material.amount ? material.amount + ' g' : '정보 없음')  + "</td>" +
                                        "</tr>";

                            materialTableBody.append(row); // 테이블에 추가
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

    // 제품 및 수량입력 안하고 제작 버튼 클릭시 메세지
    $(document).ready(function() {
        $("#produce-btn").click(function(event) {
            let selectedProductNo = $("#product-select1").val();
            let quantity = $("#amount-input").val();

            if (!selectedProductNo) {
                alert("제품을 선택하세요!");
                event.preventDefault(); // 폼 제출 방지
                return false;
            }

            if (!quantity || quantity <= 0) {
                alert("수량을 입력하세요!");
                event.preventDefault(); // 폼 제출 방지
                return false;
            }
        });
    });

    // 제작후 성공 or 실패 메시지 부분
    $(document).ready(function() {
        // Flash Attribute 메시지(alert) 표시
        let successMessage = "${message}";
        let errorMessage = "${error}";

        if (successMessage) {
            alert(successMessage);
        }

        if (errorMessage) {
            alert(errorMessage);
        }
    });
</script>


</body>
</html>
