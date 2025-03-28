<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>

<head>
  <%-- Noto Sans KR Font--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <title>Title</title>
  <style>
    th{
      background: #DDDDDD !important;
      text-align: center;
      vertical-align: middle; /* 수직 정렬 */
    }
    .icon-button {
      background: none; /* 배경 제거 */
      border: none; /* 테두리 제거 */
      padding: 0; /* 내부 여백 제거 */
      cursor: pointer; /* 마우스 오버 시 클릭 가능하도록 설정 */
    }

    .icon-button img {
      display: block; /* 버튼 내부에서 이미지 정렬 */
    }
    td {
      text-align: center;
      vertical-align: middle; /* 수직 정렬 */
    }

  </style>


</head>
<body>
<div class="container mt-3">
  <table class="table table-hover">
    <thead>
    <tr>
      <th> <input type="checkbox"></th>
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
      <td><input type="checkbox"></td>
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
      <td><input type="checkbox"></td>
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
      <td><input type="checkbox"></td>
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
      <td><input type="checkbox"></td>
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
      <td><input type="checkbox"></td>
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

</body>
</html>