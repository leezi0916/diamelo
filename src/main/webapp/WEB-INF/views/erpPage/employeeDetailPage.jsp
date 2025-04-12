<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Diamelo</title>
  <%-- 공통 레이아웃 및 기본 스타일 적용 --%>
  <link rel="stylesheet" href="/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="/css/default.css" />
  <link rel="stylesheet" href="/css/erp/employeeDetailPageStyle.css" />

    <script src="/js/erp/employeeDetailPage.js"></script>


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
      <div class="page-body-content">
        <form action="empDetailSearch.erp" method="post" enctype="multipart/form-data">
          <div id="page-body-content-div">
            <div class="page-body-content-div-input-div">
              <p>이름</p>
              <input type="text" class="input-box"  value="${e.userName}" name="userName" required>
              <p>프로필</p>
                <div id="insert_image">

<%--                  <img src="${e.changeName}">--%>

                  <label for="file" id="image">
                    <div></div>
                    <div id="image-text">
                        <c:choose>
                            <c:when test="${not empty e.changeName}">
                                <img src="${e.changeName}">
                            </c:when>
                            <c:otherwise>
                                사진 추가
                            </c:otherwise>

                        </c:choose>
                        </div>
                    <div></div>
                  </label>
                  <input type="file" name="refile" id="file" accept="image/*" onchange="changeImage(this)">
                </div>

            </div>
            <div class="page-body-content-div-input-div">
              <p>전화번호</p>
              <input type="text" class="input-box"  value="${e.phone}" name="phone">
              <p>입사 날짜</p>
              <input type="text" class="input-box" readonly value="${e.enrollDate}" name="updateDate">

            </div>

            <div class="page-body-content-div-input-div">
              <p>이메일</p>
              <input type="text" class="input-box"  value="${e.email}" name="email">
              <p>직급</p>
              <select class="input-box" oninvalid="" name="jobCode">
                <option value="J1" <c:if test="${e.jobCode == 'J1'}">selected</c:if>>사원</option>
                <option value="J2" <c:if test="${e.jobCode == 'J2'}">selected</c:if>>대리</option>
                <option value="J3" <c:if test="${e.jobCode == 'J3'}">selected</c:if>>과장</option>
                <option value="J4" <c:if test="${e.jobCode == 'J4'}">selected</c:if>>부장</option>
              </select>

            </div>

            <div class="page-body-content-div-input-div">
              <p>아이디</p>
              <input type="text" class="input-box" readonly value="${e.userId}" name="userId">
              <p>월급</p>
              <input type="text" class="input-box" value="${e.salary}" readonly>

            </div>
            <div class="page-body-content-div-input-div">
              <p>상태</p>
              <select class="input-box" oninvalid="" name="status">
                <option value="Y" <c:if test="${e.status == 'Y'}">selected</c:if>>승인</option>
                <option value="W" <c:if test="${e.status == 'W'}">selected</c:if>>대기</option>
                  <c:if test="${e.status =='N'}">
                      <option value="N" <c:if test="${e.status == 'N'}">selected</c:if>>반려</option>
                  </c:if>

              </select>
              <p>부서</p>
              <select class="input-box" oninvalid="" name="deptCode">
                  <option value="D1" <c:if test="${e.deptCode == 'D1'}">selected</c:if>>영업부</option>
                  <option value="D2" <c:if test="${e.deptCode == 'D2'}">selected</c:if>>마케팅부</option>
                  <option value="D3" <c:if test="${e.deptCode == 'D3'}">selected</c:if>>생산부</option>
                  <option value="D4" <c:if test="${e.deptCode == 'D4'}">selected</c:if>>인사부</option>
                  <option value="D5" <c:if test="${e.deptCode == 'D5'}">selected</c:if>>개발부</option>
                </select>
            </div>
          </div>
          <div id="page-body-content-button-div">
            <button type="submit" class="submitBtn" onclick="location.href='empAdminList.erp'">
              <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.65367 1.39062V12.6092M1.04437 6.99992H12.263" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              수정하기
            </button>
            <input type="button" class="submitBtn" value="인사 관리 페이지 돌아가기" onclick="location.href='empAdminList.erp'">
          </div>
        </form>
      </div>

    </div>
  </div>
</div>

</body>
</html>
