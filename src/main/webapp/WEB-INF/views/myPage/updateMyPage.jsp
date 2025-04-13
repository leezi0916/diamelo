<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <%-- Noto Sans KR Font--%>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
            rel="stylesheet"
        />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/crm/myPageViewStyle.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css" />
        <title>Title</title>
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
                <div class="div-loginarea">
                    <div class="div-area1">
                        <div id="imgdiv1">
                            <div id="imgdiv">
                                <img src="/image/etc/divh.png" alt="로고이미지" />
                            </div>
                        </div>
                        <br />
                        <form action="" id="form1">
                            <div id="loginFormdiv">
                                <input
                                    class="loginForm"
                                    type="button"
                                    value="개인 정보 변경"
                                    onclick="location.href='updateEnrollForm.me'"
                                />

                                <input
                                    class="loginForm"
                                    type="button"
                                    value="비밀번호 변경"
                                    onclick="location.href='updatePwEnrollForm.me'"
                                />

                                <input class="loginForm" id="userDelete" type="button" value="회원탈퇴" />

                                <input
                                    class="loginForm"
                                    type="button"
                                    value="홈 화면 가기"
                                    onclick="location.href='/'"
                                />
                            </div>
                        </form>
                    </div>
                </div>
                <div class="div-imgarea1"></div>
            </div>
        </div>

        <!-- 회원 탈퇴 모달 -->
        <form action="delete.me" method="post">
            <div id="deleteModal" class="modal">
                <div class="modal-content">
                    <div class="modal-header">
                        <h3>회원 탈퇴</h3>
                        <p>계정을 삭제하려면 현재 사용중인 비밀번호를 입력하세요</p>
                    </div>

                    <input type="password" id="thPwd" placeholder="비밀번호 입력해주세요." name="userPwd" required/>
                    <label> <input type="checkbox" id="confirmCheck" /> 동의합니다. </label>

                    <div class="modal-footer">
                        <button id="confirmDelete" class="modal-button btn-danger" type="submit">탈퇴하기</button>
                        <button id="cancelDelete" type="button" class="modal-button btn-cancel">취소</button>
                    </div>
                </div>
            </div>
        </form>

        <%-- html이 다 그려지고 나서 실행되는 deleteMember.js --%>
        <script src="/js/crm/deleteMember.js"></script>
    </body>
</html>
