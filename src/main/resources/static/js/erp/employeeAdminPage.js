
// 모달 요소 가져오기

const modal = document.getElementById("deleteModal");
const deleteBtn = document.querySelectorAll(".userDelete")
const confirmDelete = document.getElementById("confirmDelete");
const cancelDelete = document.getElementById("cancelDelete");
const confirmCheck = document.getElementById("confirmCheck"); // 체크박스
const passwordInput = document.getElementById("thPwd"); // 비밀번호 입력창
const modalText = document.getElementById("modalText")


let selectedUserId = null;
// 회원 탈퇴 버튼 클릭 시 모달 표시
deleteBtn.forEach((btn) => {
    btn.addEventListener("click", function () {
        selectedUserId = btn.dataset.userid;
        const status= btn.dataset.status;

        modalText.innerText = `아이디를 입력해주세요.`;

        passwordInput.value = "";
        confirmCheck.checked = false;
        modal.style.display = "block";
        confirmDelete.disabled = true; // 기본 비활성화
    });
});

// 체크박스 상태 감지하여 버튼 활성화/비활성화
confirmCheck.onchange = function () {
    confirmDelete.disabled = !this.checked; // 체크박스가 체크되면 버튼 활성화
};

// 취소 버튼 클릭 시 모달 닫기
cancelDelete.onclick = function () {
    modal.style.display = "none";
};

// 탈퇴 버튼 클릭 시 탈퇴 처리
confirmDelete.onclick = function () {
    const inputId = passwordInput.value.trim();

    if (inputId === "") {
        alert("아이디를 입력해주세요.");
        return;
    }

    if (inputId !== selectedUserId) {
        alert("아이디가 일치하지 않습니다.");
        return;
    }

    $.ajax({
        url: "/api/employee/empDelete.erp",
        type: "POST",
        data:{userId: selectedUserId},
        success: function(res) {
            if (res === "1") {
                alert("삭제 성공");
                location.href = "empAdminList.erp";
            } else {
                alert("삭제 실패");
            }},
        error: function (){
            alert("AJAX 통신 실패");
            modal.style.display = "none";
        }
    });
    // 실제 삭제 AJAX 또는 location.href 등으로 연결 가능
};

// 모달 외부 클릭 시 닫기
window.onclick = function (event) {
    if (event.target === modal) {
        modal.style.display = "none";
    }
};