<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Diamelo</title>
  <%-- 공통 레이아웃 및 기본 스타일 적용 --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/buyPageStyle.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
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
          전체 (?)
        </div>
      </div>
      <%-- 검색 필터 + 테이블 리스트 영역 --%>
      <div class="page-body-content">
        <%-- 검색 필터 영역 --%>
        <div id="page-body-content-search-button">
          <form action="search.buy" method="get" class="search-form">
            <input type="date" name="" id="" class="input-box" >
            <input type="date" class="input-box" >
            <input type="text" class="input-box" placeholder="구매 기업">
            <%-- 검색 버튼(아이콘 + 텍스트포함) --%>
            <button type="submit" class="input-box">
              <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
              </svg>
              조회
            </button>
          </form>
          <div class="searchBtndiv">
            <button class="searchBtn" type="button" onclick="location.href='buyAdd.erp'">
              구매서 등록
            </button>
          </div>

        </div>
        <%-- 판매 내역 테이블 영역 --%>
        <div id="page-body-content-search-list">
          <table class="table table-hover">
            <thead>
            <tr>

              <th>구매번호
                <%-- 정렬 아이콘 --%>
                <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5.61683 1.01172V9.9866M5.61683 9.9866L10.1043 5.49916M5.61683 9.9866L1.12939 5.49916" stroke="black" stroke-width="1.28213" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </th>
              <th>구매자</th>
              <th>구매처</th>
              <th>구매일자</th>

            </tr>
            </thead>
            <tbody>
            <%-- 반복 가능한 판매 내역 행 --%>
            <tr onclick="goToDetail()">

              <td>10</td>
              <td>이지묵</td>
              <td>A공장</td>
              <td>2024-01-20</td>


            </tr>
            <tr onclick="goToDetail()">

              <td>9</td>
              <td>황윤창</td>
              <td>A공장</td>
              <td>2024-03-19</td>


            </tr>
            <tr onclick="goToDetail()">

              <td>8</td>
              <td>김진석</td>
              <td>A공장</td>
              <td>2024-05-20</td>


            </tr>
            <tr onclick="goToDetail()">

              <td>7</td>
              <td>양동민</td>
              <td>A공장</td>
              <td>2024-06-18</td>

            </tr>
            <tr onclick="goToDetail()">

              <td>6</td>
              <td>홍승민</td>
              <td>A공장</td>
              <td>2024-10-10</td>

            </tr>
            <tr onclick="goToDetail()">

              <td>5</td>
              <td>이지묵</td>
              <td>A공장</td>
              <td>2024-11-11</td>

            </tr>
            <tr onclick="goToDetail()">

              <td>4</td>
              <td>김진석</td>
              <td>A공장</td>
              <td>2025-01-25</td>

            </tr>
            <tr onclick="goToDetail()">

              <td>3</td>
              <td>양동민</td>
              <td>A공장</td>
              <td>2025-02-28</td>


            </tr>
            <tr onclick="goToDetail()">

              <td>2</td>
              <td>황윤창</td>
              <td>A공장</td>
              <td>2025-03-05</td>

            </tr>
            <tr onclick="goToDetail()">

              <td>1</td>
              <td>홍승민</td>
              <td>A공장</td>
              <td>2025-03-31</td>

            </tr>

            </tbody>
          </table>
        </div>
      </div>
      <div id="page-body-page-div">
        <div>
          <div class="page-body-page-div-start">
            <p>이전</p>
          </div>
          <div>
            <p>1</p>
          </div>
          <div>
            <p>2</p>
          </div>
          <div>
            <p>3</p>
          </div>
          <div>
            <p>4</p>
          </div>
          <div>
            <p>5</p>
          </div>
          <div>
            <p>6</p>
          </div>
          <div>
            <p>7</p>
          </div>
          <div>
            <p>8</p>
          </div>
          <div>
            <p>9</p>
          </div>
          <div>
            <p>10</p>
          </div>
          <div class="page-body-page-div-end">
            <p>다음</p>
          </div>
        </div>


      </div>
    </div>
  </div>
</div>
</div>

<script>
  function goToDetail() {
    location.href = 'detail.buy';
  }
</script>
</body>
</html>
