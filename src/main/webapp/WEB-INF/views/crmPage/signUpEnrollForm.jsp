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

            <script>
                // 직업 / 기업(개인) 버튼 눌렀을 때 기업명 입력란 숨김 / 보임
                document.addEventListener('DOMContentLoaded', function () {
                    const employeeButton = document.getElementById('employee-btn');
                    const personalCompanyButton = document.getElementById('personal-company-btn');
                    const companyInputContainer = document.getElementById('company-input-container');

                    // jobCode , deptCode 가져오기
                    const jobCodeInput = document.getElementById('jobCode');
                    const deptCodeInput = document.getElementById('deptCode');

                    companyInputContainer.style.display = 'none'; // 처음에는 숨김

                    personalCompanyButton.addEventListener('click', function () {
                        personalCompanyButton.style.backgroundColor = '#7AC38F';
                        employeeButton.style.backgroundColor = '#529471';
                        companyInputContainer.style.display = 'block';

                        // 버튼 클릭시 상태값 저장
                        document.getElementById('btnStatus').value = 'personalCompany';

                        // 기업/개인 선택시 J0 , D0
                        jobCodeInput.value = 'J0';
                        deptCodeInput.value = 'D0';
                    });

                    employeeButton.addEventListener('click', function () {
                        employeeButton.style.backgroundColor = '#7AC38F';
                        personalCompanyButton.style.backgroundColor = '#529471';
                        companyInputContainer.style.display = 'none';

                        // 버튼 클릭시 상태값 저장
                        document.getElementById('btnStatus').value = 'employee';

                        // 직원 선택시 J1 , D1
                        jobCodeInput.value = 'J1';
                        deptCodeInput.value = 'D1';
                    });
                });

                let eventFlag;

                // Timeout과 clearTimeout을 사용해 ajax를 계속 보내지 않도록 조정하는 함수
                function idCheck(idInput) {
                    const id = idInput.value;

                    //id.trim() -> 공백제거
                    if (id.trim().length >= 5) {
                        clearTimeout(eventFlag); //아직 실행되지않은 setTimeout 취소 -> 0.5초안에 입력을 추가로 하면 앞에 setTimout을 취소
                        eventFlag = setTimeout(function () {
                            getIdCheck({ checkId: id }, drawIdCheckText);
                        }, 500);
                    } else {
                        document.querySelector('.error-message').style.display = 'none';
                    }
                }

                // ajax 통해서 아이디 중복체크하는 함수
                function getIdCheck(data, callback) {
                    $.ajax({
                        url: '/api/member/id',
                        data: data,
                        success: function (res) {
                            callback(res);
                        },
                        error: function () {
                            console.log('아이디 중복체크 ajax 실패');
                        },
                    });
                }

                // 아이디 중복여부 텍스트 그려주는 함수
                function drawIdCheckText(isCheck) {
                    const checkResult = document.querySelector('.error-message');
                    checkResult.style.display = 'block';
                    if (isCheck === 'Y') {
                        checkResult.style.color = 'red';
                        checkResult.innerText = '이미 사용중인 아이디입니다.';
                    } else {
                        // return 값이 "N"인 경우
                        checkResult.style.color = 'green';
                        checkResult.innerText = '사용 가능한 아이디입니다.';
                    }
                }

                // Form 내용 검증 함수
                function validateForm() {
                    // 아이디 길이 확인 변수
                    const userId = document.querySelector('#enroll-form input[name=userId]').value.trim();

                    // 비밀번호 , 비밀번호 확인 같은지 여부 변수
                    const pwd = document.querySelector('#enroll-form input[name=userPwd]').value;
                    const pwdCheck = document.querySelector('#enroll-form #userPwdCheck').value;

                    // 전화번호 양식 확인 변수
                    const phone = document.querySelector('#enroll-form input[name=phone]').value;

                    // 직원, 기업/개인 버튼 클릭 여부 변수
                    const btnStatus = document.getElementById('btnStatus').value;

                    if (userId.length < 5) {
                        // 아이디 길이 확인 검증
                        alert('아이디는 5글자 이상이어야 합니다.');
                        return false;
                    }

                    if (pwd !== pwdCheck) {
                        // 비밀번호 , 비밀번호 확인 같은지 여부 검증
                        alert('비밀번호가 일치하지 않습니다.');
                        return false;
                    }

                    const phoneRegex = /^010\d{8}$/;
                    if (!phoneRegex.test(phone)) {
                        alert("전화번호는 '010'으로 시작하고 '-' 없이 11자리 숫자여야 합니다.");
                        return false;
                    }

                    if (!btnStatus) {
                        // 직원, 기업/개인 버튼 클릭 여부 검증
                        alert('직원 또는 기업/개인 버튼을 선택해주세요.');
                        return false;
                    }
                    return true;
                }
            </script>
        </form>
    </body>
</html>
