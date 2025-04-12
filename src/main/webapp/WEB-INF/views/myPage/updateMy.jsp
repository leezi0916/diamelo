<%@ page contentType="text/html;charset=UTF-8" language="java" %> <%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>enroll</title>
        <link rel="stylesheet" href="/css/crm/updateMy.css" />
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
        <form action="upDate.me" method="post" id="enroll-form">
            <div class="container">
                <div class="logo">
                    <img src="/image/employeeImage/divh.png" alt="로고" />
                </div>
                <div class="form-container">
                    <div class="title">개인정보 변경</div>

                    <div class="input-boxs">
                        <div class="input-name">
                            <p>아이디</p>
                            <input class="input-box" type="text" value="${loginUser.userId}" name="userId" readonly />
                        </div>

                        <div class="input-name">
                            <p>이름</p>
                            <input
                                class="input-box box"
                                type="text"
                                value="${loginUser.userName}"
                                placeholder="이름"
                                name="userName"
                                maxlength="5"
                                required
                            />
                        </div>

                        <div class="input-name">
                            <p>전화번호</p>
                            <input
                                class="input-box box"
                                type="text"
                                value="${loginUser.phone}"
                                placeholder="전화번호"
                                name="phone"
                                maxlength="11"
                                required
                            />
                        </div>

                        <div class="input-name">
                            <p>E-MAIL</p>
                            <input
                                class="input-box box"
                                type="text"
                                value="${loginUser.email}"
                                placeholder="이메일"
                                name="email"
                                required
                            />
                        </div>

                        <div class="input-name">
                            <p>개인 / 기업명</p>
                            <input
                                class="input-box box"
                                type="text"
                                value="${loginUser.companyName}"
                                placeholder="개인 / 기업명"
                                name="companyName"
                            />
                        </div>
                    </div>

                    <div id="buttons">
                        <button class="button" type="submit"  onclick="return validateForm()">변경하기</button>
                        <button class="button" type="button" onclick="location.href='myPageDetail.me'">뒤로가기</button>
                    </div>
                </div>
            </div>

        </form>

        <script>

            // Form 내용 검증 함수
            function validateForm() {
                // 전화번호 양식 확인 변수
                const phone = document.querySelector('#enroll-form input[name=phone]').value;

                const phoneRegex = /^010\d{8}$/;
                if (!phoneRegex.test(phone)) {
                    alert("전화번호는 '010'으로 시작하고 '-' 없이 11자리 숫자여야 합니다.");
                    return false;
                }
                return true;
            }

        </script>
    </body>
</html>
