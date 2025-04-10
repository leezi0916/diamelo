// Form 내용 검증 함수
function validateForm() {
    // 새로운 비밀번호 , 새 비밀번호 확인 같은지 여부 변수
    const newPwd = document.querySelector('#enroll-form input[name=newPwd]').value;
    const newPwdCheck = document.querySelector('#enroll-form #newPwdCheck').value;

    if (newPwd !== newPwdCheck) {
        // 새로운 비밀번호 , 새 비밀번호 확인 같은지 여부 검증
        alert('비밀번호가 일치하지 않습니다.');
        return false;
    }

    return true;
}