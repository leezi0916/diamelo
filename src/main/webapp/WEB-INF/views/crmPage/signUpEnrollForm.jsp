<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>enroll</title>
        <link rel="stylesheet" href="/css/crm/signUpEnrollForm.css" />
        <link rel="stylesheet" href="/css/default.css" />

        <!-- JavaScript -->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

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

        <form action="signUp.me" method="post" id="enroll-form">
            <div class="container">
                <div class="logo">
                    <img src="/image/employeeImage/divh.png" alt="로고" />
                </div>
                <div class="form-container">
                    <div class="title">회원가입 정보를 입력해주세요!</div>

                    <div class="input-boxs">
                        <input
                            class="input-box"
                            type="text"
                            placeholder="아이디"
                            name="userId"
                            id="userId"
                            required
                            onkeyup="idCheck(this)"
                        />

                        <div class="error-message"><%-- Ajax로 반환되는 값 통해서 text 추가 --%></div>

                        <input class="input-box" type="password" placeholder="비밀번호" name="userPwd" required />
                        <input
                            class="input-box"
                            type="password"
                            placeholder="비밀번호 확인"
                            id="userPwdCheck"
                            required
                        />
                        <input
                            class="input-box"
                            type="text"
                            placeholder="이름"
                            name="userName"
                            required
                            maxlength="5"
                        />
                        <input
                            class="input-box"
                            type="text"
                            placeholder="전화번호 ( '-' 제외)"
                            name="phone"
                            required
                            maxlength="11"
                        />
                        <input class="input-box" type="email" placeholder="이메일" name="email" required />
                    </div>

                    <div class="buttons">
                        <%-- 직원 , 기업/개인 탭이 클릭되었는지 추적하기 위해 추가--%>
                        <input type="hidden" id="btnStatus" />

                        <%-- jobCode , deptCode 넘기기 위해 추가 --%>
                        <input type="hidden" name="jobCode" id="jobCode" />
                        <input type="hidden" name="deptCode" id="deptCode" />

                        <div class="button-group">
                            <button type="button" id="employee-btn" class="small-button">직원</button>
                            <button type="button" id="personal-company-btn" class="small-button">개인 / 기업</button>
                        </div>
                        <div id="company-input-container">
                            <input class="input-box" type="text" placeholder="개인/기업명" name="companyName" />
                        </div>

                        <button class="button" type="submit" onclick="return validateForm()">가입하기</button>
                        <button type="button" class="button" onclick="location.href='loginForm.me'">뒤로가기</button>
                    </div>
                </div>
            </div>
        </form>
        <%-- html이 다 그려지고 나서 실행되는 insertMember.js --%>
        <script src="/js/crm/insertMember.js"></script>
    </body>
</html>
