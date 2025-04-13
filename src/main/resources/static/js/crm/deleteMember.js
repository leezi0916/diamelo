// 모달 요소 가져오기
const modal = document.getElementById('deleteModal');
const deleteBtn = document.getElementById('userDelete');
const confirmDelete = document.getElementById('confirmDelete');
const cancelDelete = document.getElementById('cancelDelete');
const confirmCheck = document.getElementById('confirmCheck'); // 체크박스
const passwordInput = document.getElementById('thPwd'); // 비밀번호 입력창

// 회원 탈퇴 버튼 클릭 시 모달 표시
deleteBtn.onclick = function () {
    modal.style.display = 'block';
    confirmDelete.disabled = true; // 기본적으로 비활성화
};

// 체크박스 상태 감지하여 버튼 활성화/비활성화
confirmCheck.onchange = function () {
    confirmDelete.disabled = !this.checked; // 체크박스가 체크되면 버튼 활성화
};

// 취소 버튼 클릭 시 모달 닫기
cancelDelete.onclick = function () {
    modal.style.display = 'none';
};

// 탈퇴 버튼 클릭 시 탈퇴 처리
confirmDelete.onclick = function () {
    if (passwordInput.value.trim() === '') {
        alert('비밀번호를 입력해주세요.');
        return;
    }

    modal.style.display = 'none';
};

// 모달 외부 클릭 시 닫기
window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = 'none';
    }
};