<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%-- Noto Sans KR Font--%>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
            rel="stylesheet"
        />

        <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

        <link rel="stylesheet" href="/css/index.css" />
        <link rel="stylesheet" href="/css/default.css" />

        <title>Diamelo</title>
    </head>
    <body>
        <c:if test="${ not empty alertMsg}">
            <script>
                alert('${alertMsg}');
            </script>
            <c:remove var="alertMsg" scope="session" />
        </c:if>

        <div id="fullarea">
            <div class="div-area">
                <!-- <%-- 로그인 영역 --%> -->
                <div class="div-loginarea">
                    <div class="div-area1">
                        <!-- <%-- 로고 이미지 영역 --%> -->
                        <div id="imgdiv1">
                            <div id="imgdiv">
                                <img src="/image/etc/logo.png" alt="로고이미지" />
                            </div>
                        </div>

                        <!-- <%-- 로그인 폼 --%> -->
                        <form action="login.me" id="form1" method="post">
                            <div id="loginFormdiv">
                                <!-- <%-- 아이디 입력 필드 --%> -->
                                <div id="thId">
                                    <!-- <%-- 사용자 아이콘 SVG --%> -->
                                    <svg
                                        width="40"
                                        height="40"
                                        viewBox="0 0 40 40"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M32.5332 32.3194C30.8398 26.9643 26.2898 23.896 20.0448 23.896H19.9998C13.7382 23.861 9.16482 26.951 7.46815 32.3194L7.27148 32.9427L7.82815 33.2827C11.0915 35.2727 15.1615 36.281 19.9215 36.281C19.9748 36.281 20.0282 36.281 20.0798 36.281C24.9065 36.281 28.8632 35.2993 32.1732 33.2827L32.7298 32.9427L32.5332 32.3194Z"
                                            fill="#529471"
                                        />
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M20.0007 20.1824C24.539 20.1824 28.2324 16.4907 28.2324 11.9524C28.2324 7.41237 24.539 3.7207 20.0007 3.7207C15.4624 3.7207 11.7707 7.41237 11.7707 11.9524C11.7707 16.4907 15.4624 20.1824 20.0007 20.1824Z"
                                            fill="#529471"
                                        />
                                    </svg>
                                    <input type="text" placeholder="아이디를 입력하세요." name="userId" />
                                </div>
                                <!-- <%-- 비밀번호 입력 필드 --%> -->
                                <div id="thPwd">
                                    <!-- <%-- 자물쇠 아이콘 SVG --%> -->
                                    <svg
                                        width="40"
                                        height="40"
                                        viewBox="0 0 40 40"
                                        fill="none"
                                        xmlns="http://www.w3.org/2000/svg"
                                    >
                                        <path
                                            fill-rule="evenodd"
                                            clip-rule="evenodd"
                                            d="M26.3491 15.0044H13.6491V12.3494C13.6558 10.6594 14.3208 9.07111 15.5241 7.87944C16.7208 6.69444 18.3024 6.04278 19.9891 6.04278H20.0158C23.5091 6.04278 26.3491 8.88444 26.3491 12.3778V15.0044ZM18.5158 28.8328H21.0158V22.6311H18.5158V28.8328ZM28.8491 15.0044V12.3778C28.8491 7.50611 24.8858 3.54278 20.0208 3.54278C17.6824 3.49444 15.4408 4.44278 13.7658 6.10278C12.0874 7.76444 11.1591 9.97944 11.1491 12.3778V15.0044H6.48242V36.4594H33.5158V15.0044H28.8491Z"
                                            fill="#529471"
                                        />
                                    </svg>
                                    <input type="password" placeholder="비밀번호를 입력하세요." name="userPwd" />
                                </div>
                                <!-- <%-- 로그인 버튼 --%> -->
                                <input class="loginForm" type="submit" value="로그인" />

                                <!-- <%-- 구글 로그인 버튼 --%> -->
                                <input class="loginForm" type="button" value="구글 로그인" onclick="googleLoginClick()"/>
                            </div>

                            <!-- <%-- 아이디/비밀번호 찾기 및 회원가입 링크 --%> -->
                            <div id="thdiv">
                                <div>
                                    <a href="">아이디 찾기</a>
                                </div>
                                <div>
                                    <p>|</p>
                                </div>
                                <div><a href="">비밀번호 찾기</a></div>
                                <div><p>|</p></div>
                                <div><a href="signUpEnrollForm.me">회원 가입</a></div>
                            </div>
                        </form>
                    </div>
                </div>
                <!-- <%-- 우측 이미지 영역 --%> -->
                <div class="div-imgarea"></div>
            </div>
        </div>
        <script>
            function googleLoginClick() {
                // https://accounts.google.com/o/oauth2/v2/auth로 요청을 보내야한다.
                // client_id와 같은 필수값이 필요하여 서버로부터 가져와서 요청을 보내겠다.
                $.ajax({
                    url: "/api/config/google/login",
                    success: function (res) {
                        console.log(res)
                        const url = 'https://accounts.google.com/o/oauth2/v2/auth?client_id='
                            + res.clientId
                            + "&redirect_uri=" + res.redirectUrl
                            + "&response_type=code"
                            + "&scope=email profile";

                        location.href = url;

                    }, error: function (err) {
                        console.log("login config info ajax 실패" + err);
                    },
                })
            }
        </script>

    </body>
</html>
