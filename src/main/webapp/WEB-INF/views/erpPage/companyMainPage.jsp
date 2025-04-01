<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diamelo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/companyMainPageStyle.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
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
            전체(5)
          </p>
        </div>

      </div>
      <div id="page-body-content">
        <form id="search-company">
          <input type="text" placeholder="기업명" id="search-companyName">
          <input  type="text" placeholder="대표자명" id="search-ceoName">
          <button id="searchBtn">
            <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
            </svg>
            조회
          </button>
          <div id="add-btn-wrap">
            <button id="addBtn">
              거래처 관리자 페이지
            </button>
          </div>
        </form>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>번호</th>
            <th>기업명</th>
            <th>대표자명</th>
            <th>연락처</th>
            <th>이메일</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>5</td>
            <td>올리브영</td>
            <td>김대표</td>
            <td>01044434442</td>
            <td>kim@gmail.com</td>
          </tr>
          <tr>
            <td>4</td>
            <td>다이소</td>
            <td>이대표</td>
            <td>01022232224</td>
            <td>lee@gmail.com</td>
          </tr>
          <tr>
            <td>3</td>
            <td>이마트</td>
            <td>박대표</td>
            <td>01099959995</td>
            <td>park@gmail.com</td>
          </tr>
          <tr>
            <td>2</td>
            <td>홈플러스</td>
            <td>최대표</td>
            <td>01088858885</td>
            <td>choi@gmail.com</td>
          </tr>
          <tr>
            <td>1</td>
            <td>무신사</td>
            <td>정대표</td>
            <td>01077757775</td>
            <td>jung@gmail.com</td>
          </tr>
          </tbody>
        </table>
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
</body>
</html>
