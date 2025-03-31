<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Diamelo</title>
    <%-- 공통 레이아웃 및 기본 스타일 적용 --%>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/buyDetailPageStyle.css" />

</head>
<body  style="background: #f8f8f8">
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp" />

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp" />

        <!-- 페이지 본문 -->
        <div class="page-body">
            <%-- 페이지 제목 영역 --%>
            <div class="page-body-header">
                <div id="page-body-header-text">
                    전체
                </div>
            </div>
            <%-- 검색 필터 + 테이블 리스트 영역 --%>
            <div id="page-body-content-information">
                <p>구매 번호 :</p>
                <p>186584</p>
                <p>구매처 :</p>
                <p>A공장</p>
                <p>구매일자 :</p>
                <p>2024-12-30</p>
            </div>

            <div class="page-body-content1">
                <table class="content-table table-hover">
                    <thead>
                    <tr class="page-body-content-th">
                        <th><input type="checkbox"></th>
                        <th></th>
                        <th>0품목</th>
                        <th>총 수량</th>

                        <th>합계 금액 0원</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%-- 각 제품 항목(이미지, 이름, 수량) 5  15% 15% 30% 15% 15%--%>
                    <tr>
                        <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                        <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                        <td class="page-body-content-material-list-name">히알루론산</td>
                        <td class="page-body-content-material-list-description">수량 5개</td>
                        <td class="page-body-content-material-list-capacity">9,330원</td>
                    </tr>
                    <tr>
                        <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                        <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                        <td class="page-body-content-material-list-name">히알루론산</td>
                        <td class="page-body-content-material-list-description">수량 5개</td>
                        <td class="page-body-content-material-list-capacity">9,330원</td>
                    </tr>
                    <tr>
                        <td class="page-body-content-material-list-check"><input type="checkbox"></td>
                        <td class="page-body-content-material-list-img" style="background-image: url('/resources/image/productImgae/product1.png')"></td>
                        <td class="page-body-content-material-list-name">히알루론산</td>
                        <td class="page-body-content-material-list-description">수량 5개</td>
                        <td class="page-body-content-material-list-capacity">9,330원</td>
                    </tr>


                    </tbody>
                </table>



            </div>
            <div class="page-body-content">
                <form>
                    <div id="page-body-content-div">
                        <div class="page-body-content-div-input-div">
                            <p>이름</p>
                            <input type="text" class="input-box" readonly value="admin">
                            <p>입사 날짜</p>
                            <input type="text" class="input-box" readonly value="2020-01-15">
                        </div>
                        <div class="page-body-content-div-input-div">
                            <p>전화번호</p>
                            <input type="text" class="input-box" readonly value="010-1111-2222">
                            <p>직급</p>
                            <input type="text" class="input-box" readonly value="부장">
                        </div>
                        <div class="page-body-content-div-input-div">
                            <p>이메일</p>
                            <input type="text" class="input-box" readonly value="admin@naver.com">
                            <p>월급</p>
                            <input type="text" class="input-box" readonly value="3,000,000">
                        </div>
                        <div id="page-body-content-div-input-div">
                            <p></p>
                            <p></p>
                            <p>비고</p>
                            <input type="text" class="input-box" readonly value="admin">


                        </div>
                    </div>

                </form>
            </div>
                <div id="page-body-content-button-div">
                    <input type="button" class="submitBtn" value="인사 관리 페이지 돌아가기">
                </div>

        </div>
    </div>
</div>

</body>
</html>
