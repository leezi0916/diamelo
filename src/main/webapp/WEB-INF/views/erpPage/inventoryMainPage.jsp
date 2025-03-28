<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diamelo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/inventoryMainPageStyle.css" />
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
          <button id="proBtn">
            제품 (?)
          </button>
        </div>
        <div class="page-body-header-text">
          <button id="mtBtn">
            재료 (?)
          </button>
        </div>
      </div>


      <div id="page-body-content">

        <form id="search-inventory">

          <select id="search-category">
            <option>분류</option>
            <option>스킨</option>
            <option>로션</option>
            <option>썬크림</option>
            <option>미용</option>
          </select>

          <input type="text" placeholder="번호" id="search-number">

          <input  type="text" placeholder="제품명을 입력하세요." id="search-product">


          <button id="searchBtn">
            <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
              <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
            </svg>
            조회
          </button>
          <div id="add-btn-wrap">
            <button id="addBtn">
              <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>

              제품 등록
            </button>
          </div>
        </form>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>번호</th>
            <th>품목</th>
            <th>분류</th>
            <th>재고 수량</th>
            <th>가격</th>
            <th>비고</th>
            <th>수정</th>
            <th>삭제</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>5</td>
            <td>E제품</td>
            <td>미용</td>
            <td>100</td>
            <td>30,000</td>
            <td>남성용 비비크림</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>D제품</td>
            <td>썬크림</td>
            <td>200</td>
            <td>23,000</td>
            <td>SPA+50 자외선 차단</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>C제품</td>
            <td>로션</td>
            <td>150</td>
            <td>15,000</td>
            <td>피부보습 올인원 로션</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>B제품</td>
            <td>스킨</td>
            <td>400</td>
            <td>20,000</td>
            <td>밤에 케어하는 스킨</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>1</td>
            <td>A제품</td>
            <td>스킨</td>
            <td>300</td>
            <td>50,000</td>
            <td>차은우 스킨</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>

      <div id="page-body-content1" style="display: none">

        <form id="search-inventory1">


              <input type="text" placeholder="번호" id="search-number1">

              <input  type="text" placeholder="재료명을 입력하세요." id="search-product1">


              <button id="searchBtn1">
                <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
                </svg>
                조회
              </button>
          <div id="add-btn-wrap1">
            <button id="addBtn1">
              <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
              </svg>

              재료 등록
            </button>
          </div>
            </form>
        <table class="table table-hover">
          <thead>
          <tr>
            <th>번호</th>
            <th>품목</th>
            <th>재고 수량</th>
            <th>가격</th>
            <th>비고</th>
            <th>수정</th>
            <th>삭제</th>
          </tr>
          </thead>
          <tbody>
          <tr>
            <td>5</td>
            <td>재료5</td>
            <td>100</td>
            <td>30,000</td>
            <td>~ 성분</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>4</td>
            <td>재료4</td>
            <td>200</td>
            <td>23,000</td>
            <td>~ 성분</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>3</td>
            <td>재료3</td>
            <td>150</td>
            <td>15,000</td>
            <td>~ 성분</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>2</td>
            <td>재료2</td>
            <td>400</td>
            <td>20,000</td>
            <td>~ 성분</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          <tr>
            <td>1</td>
            <td>재료1</td>
            <td>300</td>
            <td>50,000</td>
            <td>~ 성분</td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/update_icon.png" alt="수정" width="20">
              </button>
            </td>
            <td>
              <button class="icon-button">
                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
              </button>
            </td>
          </tr>
          </tbody>
        </table>
      </div>
    </div>
  </div>
</div>
<script>
  document.getElementById("proBtn").addEventListener("click", function () {
    this.style.color = "#A9A9A9";
    document.getElementById("mtBtn").style.color = "black";
    document.getElementById("page-body-content").style.display = "block";
    document.getElementById("page-body-content1").style.display = "none";
  });

  document.getElementById("mtBtn").addEventListener("click", function () {
    this.style.color = "#A9A9A9";
    document.getElementById("proBtn").style.color = "black";
    document.getElementById("page-body-content1").style.display = "block";
    document.getElementById("page-body-content").style.display = "none";
  });

</script>
</body>
</html>
