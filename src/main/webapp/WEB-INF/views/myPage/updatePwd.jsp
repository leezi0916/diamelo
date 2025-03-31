<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>enroll</title>
    <link rel="stylesheet" href="/resources/css/crm/updatePwd.css">
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
            <div class="title">비밀번호 변경</div>

            <div class="input-boxs">

                <div class="input-name">
                    <p>현재 비밀번호</p>
                    <input class="input-box" type="text" placeholder="PWD" readonly></input>
                </div>

                <div class="input-name">
                    <p>새 비밀번호</p>
                    <input class="input-box" type="text" placeholder="NEW PWD"></input>
                </div>

                <div class="input-name">
                    <p>새 비밀번호 확인</p>
                    <input class="input-box" type="text" placeholder="CHECK PWD"></input>
                </div>
            </div>

            <div id="buttons">
                <button class="button" type="submit">변경하기</button>
                <button type="button" class="button" onclick="location.href='/'">뒤로가기</button>
            </div>

        </div>
    </div>
</form>
</body>

</html>