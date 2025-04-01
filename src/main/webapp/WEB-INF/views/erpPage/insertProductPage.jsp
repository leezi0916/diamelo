<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/insertProductPageStyle.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">




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
                    제품정보 등록
                </div>
            </div>

            <form class="page-body-content" action="insert.pro" method="post">
                <div id="ingrediant_area">
                    <div id="ingre_upper">
                        <div id="ingre_upper_left">
                            <div class="input-boxs">

                                <div class="input-name">
                                    <div class="star">*</div>
                                    <p>재료명</p>
                                    <input class="input-box" type="text" placeholder="NAME"></input>
                                </div>

                                <div class="input-name">
                                    <div class="star">*</div>
                                    <p>등록일자</p>
                                    <input class="input-box" type="text" placeholder="DATE"></input>
                                </div>
                            </div>
                        </div>

                        <div id="ingre_upper_right">
                            <div class="input-boxs">

                                <div class="input-name">
                                    <p>비고</p>
                                    <input class="input-box" id="memo" type="text" placeholder="MEMO"></input>
                                </div>

                                <div class="input-name">
                                    <p>가격</p>
                                    <input class="input-box" type="text" placeholder="PRICE"></input>

                                    <div id="category">
                                        <select name="category" class="select">
                                            <option disabled selected>분류</option>
                                            <option value="apple">스킨</option>
                                            <option value="orange">로션</option>
                                            <option value="grape">선크림</option>
                                            <option value="melon">미용</option>
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
                                        <th>재료명</th>
                                        <th id="amount_th">수량</th>
                                        <th>가격</th>
                                        <th id="button_th">
                                            <button id="add_button" type="button" onclick="addRow()">+ADD</button>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </div>

                        <div id="ingre_lower_right">

                            <div id="ingre_image">
                                <div id="insert_image">
                                    <input type="file" id="imageUpload" accept="image/*" style="display: none;">
                                </div>
                                <div id="text">재료 이미지</div>
                            </div>

                        </div>


                    </div>


                    <div id="ingre_lower_button">
                        <button class="button" type="submit">+재료등록</button>
                        <button type="button" class="button" onclick="location.href='inv.erp'">뒤로가기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.addEventListener("DOMContentLoaded", function() {
        const insertImageDiv = document.getElementById("insert_image");
        const imageUploadInput = document.getElementById("imageUpload");

        // 클릭 이벤트 로그 확인
        insertImageDiv.addEventListener("click", function() {
            console.log("insert_image 클릭됨");  // ✅ 디버깅용
            imageUploadInput.click();
        });

        imageUploadInput.addEventListener("change", function(event) {
            const file = event.target.files[0];
            if (file) {
                console.log("파일 선택됨:", file.name);  // ✅ 디버깅용
                const reader = new FileReader();
                reader.onload = function(e) {
                    console.log("이미지 로딩 완료");  // ✅ 디버깅용
                    insertImageDiv.style.backgroundImage = `url(${e.target.result})`;
                    insertImageDiv.style.backgroundSize = "cover";
                    insertImageDiv.style.backgroundPosition = "center";
                    insertImageDiv.style.backgroundRepeat = "no-repeat";
                    insertImageDiv.textContent = "";
                };
                reader.readAsDataURL(file);
            }
        });
    });





    function addRow() {
        const table = document.getElementById("dynamicTable").getElementsByTagName('tbody')[0];

        const newRow = table.insertRow();
        newRow.innerHTML = `
        <td><input type="text" placeholder="재료명" class="table-input"></td>
        <td><input type="number" placeholder="수량" class="table-input"></td>
        <td><input type="text" placeholder="PRICE" class="table-input"></td>
        <td><button type="button" onclick="removeRow(this)" id="delete-btn" class="button">삭제</button></td>
    `;

        updateScroll();
    }

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
        } else {
            tableContainer.style.overflowY = "hidden";
        }
    }


</script>

</body>

</html>
