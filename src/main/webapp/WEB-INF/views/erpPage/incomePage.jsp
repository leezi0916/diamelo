<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 31.
  Time: 오후 2:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/incomePage.css" />
    <title>Title</title>
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
      <%-- 페이지 제목 영역 --%>
      <div class="page-body-header">
        <div id="page-body-header-text">
          매출내역(5)
        </div>
      </div>
      <%-- 검색 필터 + 테이블 리스트 영역 --%>
      <div class="page-body-content">
        <%-- 검색 필터 영역 --%>
        <div id="page-body-content-search-button">

          <form action="" class="search-form">
            <select class="input-box">
              <option value="전체" selected >전체</option>
              <option value="소득">소득</option>
              <option value="지출">지출</option>
            </select>
            <input type="date" name="" id="" class="input-box" >
            <input type="date" class="input-box" >
            <input type="text" class="input-box" placeholder="거래처">
            <%-- 검색 버튼(아이콘 + 텍스트포함) --%>
            <button type="submit" class="input-box">
              <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
              </svg>
              조회
            </button>
          </form>

        </div>
        <%-- 판매 내역 테이블 영역 --%>
        <div id="page-body-content-search-list">
          <table class="table table-hover">
            <thead>
            <tr>
              <th>매출번호</th>
              <th>거래처</th>
              <th>분류</th>
              <th>매출 일자</th>
              <th>
                매출/매입
                <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5.61683 1.01172V9.9866M5.61683 9.9866L10.1043 5.49916M5.61683 9.9866L1.12939 5.49916" stroke="black" stroke-width="1.28213" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </th>
            </tr>
            </thead>
            <tbody>
            <%-- 반복 가능한 판매 내역 행 --%>
            <tr class="table-detail">
              <td>5</td>
              <td>올리브영</td>
              <td>소득</td>
              <td>2025/03/02</td>
              <td style="color: blue">1,750,000</td>
            </tr>

            <tr class="table-detail">
              <td>4</td>
              <td>아리따움</td>
              <td>소득</td>
              <td>2025/03/02</td>
              <td style="color: blue">6,000,000</td>
            </tr>

            <tr class="table-detail">
              <td>3</td>
              <td>올리브영</td>
              <td>소득</td>
              <td>2025/03/02</td>
              <td style="color: blue">4,500,000</td>
            </tr>

            <tr class="table-detail">
              <td>2</td>
              <td>A공장</td>
              <td>지출</td>
              <td>2025/03/02</td>
              <td style="color: red">6,000,000</td>
            </tr>

            <tr class="table-detail">
              <td>1</td>
              <td>B공장</td>
              <td>지출</td>
              <td>2025/03/02</td>
              <td style="color: red">6,000,000</td>
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
