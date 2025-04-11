<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>enroll</title>
        <link rel="stylesheet" href="/css/crm/updatePwd.css" />
        <link rel="stylesheet" href="/css/default.css" />

        <%-- Noto Sans KR Font--%>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
            rel="stylesheet"
        />

    </head>
    <body>
        <c:if test="${ not empty alertMsg}">
            <script>
                alert('${alertMsg}');
            </script>
            <c:remove var="alertMsg" scope="session" />
        </c:if>

        <form action="updatePwd.me" id="enroll-form" method="post">
            <div class="container">
                <div class="logo">
                    <img src="/image/employeeImage/divh.png" alt="로고" />
                </div>
                <div class="form-container">
                    <div class="title">비밀번호 변경</div>

                    <div class="input-boxs">
                        <div class="input-name">
                            <p>현재 비밀번호</p>
                            <input class="input-box" type="password" placeholder="현재 비밀번호" name="currentPwd" required/>
                        </div>

                        <div class="input-name">
                            <p>새 비밀번호</p>
                            <input class="input-box box" type="password" placeholder="새로운 비밀번호" name="newPwd" required/>
                        </div>

                        <div class="input-name">
                            <p>새 비밀번호 확인</p>
                            <input class="input-box box" type="password" placeholder="새 비밀번호 확인" id="newPwdCheck" required/>
                        </div>
                    </div>

                    <div id="buttons">
                        <button class="button" type="submit" onclick="return validateForm()">변경하기</button>
                        <button type="button" class="button" onclick="location.href='myPageDetail.me'">뒤로가기</button>
                    </div>
                </div>
            </div>
        </form>
        <%-- html이 다 그려지고 나서 실행되는 updatePwd.js --%>
        <script src="/js/crm/updatePwd.js"></script>
    </body>
</html>
