<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Diamelo</title>
  <%-- 공통 레이아웃 및 기본 스타일 적용 --%>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/employeeDetailPageStyle.css" />

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
        <form action="" method="post">
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
              <p>아이디</p>
              <input type="text" class="input-box" readonly value="admin">
              <p>프로필</p>
              <div>
              <div id="insert_image">
                  <input type="file" id="imageUpload" accept="image/*" style="display: none;">
              </div>
              </div>
            </div>
          </div>
          <div id="page-body-content-button-div">
            <button type="submit" class="submitBtn">
              <svg width="14" height="14" viewBox="0 0 14 14" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M6.65367 1.39062V12.6092M1.04437 6.99992H12.263" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>
              수정하기
            </button>
            <input type="button" class="submitBtn" value="인사 관리 페이지 돌아가기" onclick="location.href='empAdmin.erp'">
          </div>
        </form>
      </div>

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

</script>
</body>
</html>
