<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>enroll</title>
    <link rel="stylesheet" href="/resources/css/crm/signUpEnrollForm.css">

    <%-- Noto Sans KR Font--%>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">

    <script>
        // 직업 / 기업(개인) 버튼 눌렀을 때 기업명 입력란 숨김 / 보임
        document.addEventListener("DOMContentLoaded", function () {
            const employeeButton = document.getElementById("employee-btn");
            const personalCompanyButton = document.getElementById("personal-company-btn");
            const companyInputContainer = document.getElementById("company-input-container");

            companyInputContainer.style.display = "none"; // 처음에는 숨김

            personalCompanyButton.addEventListener("click", function (event) {
                event.preventDefault();
                companyInputContainer.style.display = "block";
            });

            employeeButton.addEventListener("click", function (event) {
                event.preventDefault();
                companyInputContainer.style.display = "none";
            });
        });
    </script>
</head>
<body>
<form action="">
    <div class="container">
        <div class="logo">
            <img src="/resources/image/logo.png" alt="로고">
        </div>
        <div class="form-container">
            <div class="title">회원가입 정보를 입력해주세요!</div>

            <div class="input-boxs">
                <input class="input-box" type="text" placeholder="아이디"></input>

                <div class="error-message">사용할 수 없는 아이디입니다.</div>

                <input class="input-box" type="text" placeholder="비밀번호"></input>
                <input class="input-box" type="text" placeholder="비밀번호 확인"></input>
                <input class="input-box" type="text" placeholder="이름"></input>
                <input class="input-box" type="text" placeholder="전화번호 ( '-' 제외)"></input>
                <input class="input-box" type="text" placeholder="이메일"></input>
            </div>

            <div class="buttons">
                <div class="button-group">
                    <button id="employee-btn" class="small-button">직원</button>
                    <button id="personal-company-btn" class="small-button">개인 / 기업</button>
                </div>
                <div id="company-input-container">
                    <input class="input-box" type="text" placeholder="개인/기업명"></input>
                </div>

                <button class="button" type="submit">가입하기</button>
                <button class="button">뒤로가기</button>
            </div>

        </div>
    </div>
</form>
</body>

</html>