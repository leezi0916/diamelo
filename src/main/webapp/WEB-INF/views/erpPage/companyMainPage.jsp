<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diamelo</title>
  <link rel="stylesheet" href="/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="/css/erp/companyMainPageStyle.css" />
  <link rel="stylesheet" href="/css/default.css" />
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
        <div class="page-body-header-text">
          <p>
            전체(${boardCount})
          </p>
        </div>

      </div>
      <div id="page-body-content">

        <form id="search-company" action="select.com" method="get">
          <input type="text" placeholder="기업명" id="search-companyName" name="companyName">
          <input  type="text" placeholder="대표자명" id="search-ceoName" name="userName">
          <button id="searchBtn" type="submit">
            <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
            </svg>
            조회
          </button>
          <div id="add-btn-wrap">
              <button id="addBtn" type="button" onclick="location.href='compAdmin.erp'">
                거래처 관리자 페이지
              </button>
          </div>
        </form>

        <table class="table table-hover">
          <thead>
          <tr>
            <th>기업명</th>
            <th>대표자명</th>
            <th>연락처</th>
            <th>이메일</th>
          </tr>
          </thead>
          <tbody>
          <c:choose>
            <c:when test="${not empty list}">
              <c:forEach var="e" items="${list}">
                <tr>
                  <td>${e.companyName}</td>
                  <td>${e.userName}</td>
                  <td>${e.phone}</td>
                  <td>${e.email}</td>
                </tr>
              </c:forEach>
            </c:when>
            <c:otherwise>
              <tr>
                <td><h3>정보가 없습니다.</h3></td>
              </tr>
            </c:otherwise>
          </c:choose>
          </tbody>
        </table>
      </div>

      <c:set var="isSearch" value="false"/>
      <c:if test="${not empty companyName}">
        <c:set var="isSearch" value="true"/>
      </c:if>
      <c:if test="${not empty userName}">
        <c:set var="isSearch" value="true"/>
      </c:if>

      <c:choose>
        <c:when test="${isSearch}">
          <div id="pagingArea">
            <ul class="pagination">
              <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                  <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="select.com?apage=${pi.currentPage - 1}&companyName=${companyName}&userName=${userName}">이전</a></li>
                </c:otherwise>
              </c:choose>

              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item"><a class="page-link" href="select.com?apage=${p}&companyName=${companyName}&userName=${userName}">${p}</a></li>
              </c:forEach>

              <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                  <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="select.com?apage=${pi.currentPage + 1}&companyName=${companyName}&userName=${userName}">다음</a></li>
                </c:otherwise>
              </c:choose>
            </ul>
          </div>
        </c:when>
        <c:otherwise>
          <div id="pagingArea">
            <ul class="pagination">
              <c:choose>
                <c:when test="${ pi.currentPage eq 1 }">
                  <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="company.erp?apage=${pi.currentPage - 1}">이전</a></li>
                </c:otherwise>
              </c:choose>

              <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item"><a class="page-link" href="company.erp?apage=${p}">${p}</a></li>
              </c:forEach>

              <c:choose>
                <c:when test="${ pi.currentPage eq pi.maxPage }">
                  <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                </c:when>
                <c:otherwise>
                  <li class="page-item"><a class="page-link" href="company.erp?apage=${pi.currentPage + 1}">다음</a></li>
                </c:otherwise>
              </c:choose>
            </ul>
          </div>
        </c:otherwise>
      </c:choose>

      </div>
    </div>
  </div>
</body>
</html>
