<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>enroll</title>
  <link rel="stylesheet" href="/resources/css/crm/updateMy.css">
  <link rel="stylesheet" href="/resources/css/default.css">

  <%-- Noto Sans KR Font--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">



</head>
<body>
<form action="">
  <div class="container">
    <div class="logo">
      <img src="/resources/image/employeeImage/divh.png" alt="로고">
    </div>
    <div class="form-container">
      <div class="title">개인정보 변경</div>

      <div class="input-boxs">

        <div class="input-name">
          <p>아이디</p>
          <input class="input-box" type="text" placeholder="ID" readonly>
        </div>

        <div class="input-name">
          <p>이름</p>
          <input class="input-box box" type="text" placeholder="이름">
        </div>

        <div class="input-name">
          <p>전화번호</p>
          <input class="input-box box" type="text" placeholder="전화번호">
        </div>

        <div class="input-name">
          <p>E-MAIL</p>
          <input class="input-box box" type="text" placeholder="이메일">
        </div>

        <div class="input-name">
          <p>개인 / 기업명</p>
          <input class="input-box box" type="text" placeholder="개인 / 기업명">
        </div>
      </div>

      <div id="buttons">
        <button class="button" type="submit">변경하기</button>
        <button class="button">뒤로가기</button>
      </div>

    </div>
  </div>
</form>
</body>

</html>