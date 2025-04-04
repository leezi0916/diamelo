<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/insertIngrediantPageStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">


    <%-- Noto Sans KR Font--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
          rel="stylesheet">

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

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
                <div id="page-body-header-text">
                    재료정보 등록
                </div>
            </div>

            <form class="page-body-content" action="insert.ing" method="post">
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

                                <div class="input-name">
                                    <div class="star">*</div>
                                    <p>가격</p>
                                    <input class="input-box" type="text" placeholder="PRICE"></input>
                                </div>
                            </div>
                        </div>

                        <div id="ingre_upper_right">
                            <div id="ingre_image">
                                <div id="insert_image">
                                    <label for="file" id="image">
                                        <div></div>
                                        <div id="image-text">제품 사진 추가</div>
                                        <div></div>
                                    </label>
                                    <input type="file" name="file" id="file" accept="image/*"
                                           onchange="changeImage(this)">
                                </div>
                                <div id="text">재료 이미지</div>
                            </div>

                        </div>

                    </div>
                    <div id="ingre_lower">
                        <div id="ingre_lower_memo">
                            <div id="input-memo-area">

                                <div id="memo">비고</div>
                                <textarea id="input-memo-box" type="text" placeholder="MEMO"></textarea>

                            </div>
                        </div>

                        <div id="ingre_lower_button">
                            <button class="button" type="submit">+재료등록</button>
                            <button type="button" class="button" onclick="location.href='inv.erp'">뒤로가기</button>
                        </div>
                    </div>
                </div>
            </form>
        </div>

        <script>
            <%--  제품 사진 추가 및 삭제 --%>

            function changeImage(input) {
                let file = input.files[0];

                let img = document.createElement("img");

                img.src = URL.createObjectURL(file);
                img.style.width = "100%";
                img.style.height = "100%";
                img.style.objectFit = "cover";

                let container = document.getElementById('image');
                container.innerHTML = "";
                container.appendChild(img);
            }
        </script>
</body>
</html>
