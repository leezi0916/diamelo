<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/insertProductPageStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">




    <%-- Noto Sans KR Font--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</head>


<body >
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp"/>

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div id="page-body-header-text">
                    제품정보 수정
                </div>
            </div>

            <form class="page-body-content" action="insert.pro" method="post" enctype="multipart/form-data">
                <div id="ingrediant_area">
                    <div id="ingre_upper">
                        <div id="ingre_upper_left">
                            <div class="input-boxs">
                                <div class="input-name">
                                    <div class="star">*</div>
                                    <p>재료명</p>
                                    <input class="input-box" type="text" name="proName" value="${product.proName}">
                                </div>
                                <div class="input-name">
                                    <div class="star">*</div>
                                    <p>등록일자</p>
                                    <input class="input-box" type="date" name="ProEnrollDate" placeholder="DATE">
                                </div>
                            </div>
                        </div>

                        <div id="ingre_upper_right">
                            <div class="input-boxs">
                                <div class="input-name">
                                    <p>비고</p>
                                    <input class="input-box" id="memo" name="proDetail" type="text" ${product.proDetail}>
                                </div>
                                <div class="input-name">
                                    <p>가격</p>
                                    <input class="input-box" type="text" name="proPrice" value="${product.proPrice}">
                                    <<div id="category">
                                        <select name="proCategoryNo" class="select">
                                            <option disabled <c:if test="${empty product}">selected</c:if>>분류</option>
                                            <option value="1" <c:if test="${product.proCategoryNo == 1}">selected</c:if>>스킨</option>
                                            <option value="2" <c:if test="${product.proCategoryNo == 2}">selected</c:if>>로션</option>
                                            <option value="3" <c:if test="${product.proCategoryNo == 3}">selected</c:if>>선크림</option>
                                            <option value="4" <c:if test="${product.proCategoryNo == 4}">selected</c:if>>수분크림</option>
                                            <option value="5" <c:if test="${product.proCategoryNo == 5}">selected</c:if>>앰플</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="ingre_lower">
                        <div id="ingre_lower_left">
                            <div class="input-name">
                                <div class="star">*</div>
                                <p>재료목록</p>
                            </div>

                            <div id="table-container">
                                <table id="dynamicTable" border="1">
                                    <thead>
                                    <tr>
                                        <th style="width: 15%;">NO.</th>
                                        <th>재료명</th>
                                        <th id="amount_th">수량(단위:g)</th>
                                        <th>가격</th>
                                        <th id="button_th">
                                            <button id="add_button" type="button" onclick="addRow()">+ADD</button>
                                        </th>
                                    </tr>
                                    </thead>

                                    <tbody>
                                        <c:forEach var="recipe" items="${recipeList}">
                                            <input type="hidden" name="matNo[]" value="${recipe.matNo}" />
                                            <input type="text" name="proName[]" value="${recipe.proName}" />
                                            <input type="number" name="amount[]" value="${recipe.amount}" />
                                            <input type="number" name="proPrice[]" value="${recipe.proPrice}" />
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </div>

                        <div id="ingre_lower_right">
                            <div style="position: relative; width: 150px; height: 180px;">
                                <input id="insert_image" type="file" name="upfile" accept="image/*" onchange="changeImage(this)">
                                <div id="image_preview">
                                    <c:if test="${not empty attachment}">
                                            <img src="${attachment.changeName}" alt="제품 이미지" width="150">
                                    </c:if>
                                </div> <!-- ✅ 미리보기 이미지 영역 -->
                            </div>
                            <p>재료 이미지</p>
                        </div>
                    </div>


                    <div id="ingre_lower_button">
                        <button class="button" type="submit">수정하기</button>
                        <button type="button" class="button" onclick="location.href='inv.erp'">뒤로가기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    <%--  제품 사진 추가 및 삭제 --%>

    function changeImage(input) {
        let file = input.files[0];

        if (file) {
            let img = document.createElement("img");
            img.src = URL.createObjectURL(file);
            img.style.width = "100%";
            img.style.height = "100%";
            img.style.objectfit = "cover";

            let container = document.getElementById("image_preview"); // ✅ 미리보기 영역으로 변경
            container.innerHTML = ""; // 기존 이미지 삭제
            container.appendChild(img); // 새 이미지 추가
        }
    }

    // 폼 제출 시 콘솔에 입력값 확인
    document.querySelector("form").addEventListener("submit", function(event) {
        event.preventDefault();  // ✅ 폼 제출 막기

        const formData = new FormData(this);

        console.log("📌 [폼 데이터 배열 변환]", [...formData.entries()]);
        console.log("📌 [선택한 파일]", formData.get("imageUpload"));

        // 실제 제출하려면 아래 코드 주석 해제
        event.target.submit();

    });

    // 재료 추가/삭제 기능
    function addRow() {
        const table = document.getElementById("dynamicTable").getElementsByTagName('tbody')[0];

        const newRow = table.insertRow();
        newRow.innerHTML = `
        <td style="width: 15%;"><input type="text" name="matNo[]" placeholder="NO." class="table-input" onblur="fetchProductName(this)"></td>
        <td><input type="text" name="proName[]" placeholder="재료명" class="table-input"></td>
        <td><input type="number" name="amount[]" placeholder="수량" class="table-input"></td>
        <td><input type="text" name="proPrice[]" placeholder="가격" class="table-input"></td>
        <td><button type="button" id="delete-btn" onclick="removeRow(this)">삭제</button></td>
    `;

        updateScroll();
    }

    // Ajax 함수


    function removeRow(button) {
        const row = button.parentNode.parentNode;
        row.parentNode.removeChild(row);
        updateScroll();
    }

    function updateScroll() {
        const tableContainer = document.getElementById("table-container");
        const rows = document.querySelectorAll("#dynamicTable tbody tr");

        if (rows.length >= 3) {
            tableContainer.style.overflowY = "auto";
            tableContainer.style.maxHeight = "200px";
        } else {
            tableContainer.style.overflowY = "hidden";
            tableContainer.style.maxHeight = "none";
        }
    }
</script>


</body>

</html>
