<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/productionPageStyle.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
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
<<<<<<< HEAD
                <form method="post" action="" enctype="multipart/form-data">
=======
                <form action="create.pro" method="post">
>>>>>>> 2d808f2903f96b1197cea423c2b68b61519a5b99
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
                                <label for="file" id="image">
                                    <div id="image-text">제품 사진 추가</div>
                                    <input type="file" name="file" id="file" accept="image/*" onchange="changeImage(this)">
                                </label>
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
                            <button type="submit">
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

<script>
<%--  제품 사진 추가 및 삭제 --%>
function changeImage(input){
let file = input.files[0];

let img = document.createElement("img");
let text = document.getElementById("image-text");

text.style.display = 'none';

img.src = URL.createObjectURL(file);
img.style.width = "100%";
img.style.height = "100%";
img.style.objectFit = "cover";

let container = document.getElementById('image');
container.appendChild(img);
}
</script>
</body>
</html>
