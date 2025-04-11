// Ajax 이용 insert, delete
function addDeleteCart({ proNo, inCart } , callback) {
    $.ajax({
        url: '/api/production/cart',
        data: {
            proNo: proNo,
            inCart: inCart
        },
        success: function (res) {
            callback(res);
            console.log(res);
        },
        error: function () {
            console.log('장바구니 추가 및 삭제 ajax 실패');
        },
    });
}

// 장바구니 상태 관리
function changeCartStatus(result, button) {
    if (result === "Add") {
        inCart("장바구니 추가하였습니다.");
        button.innerHTML = "장바구니 빼기";
        button.dataset.include = "true";
    } else if (result === "Del") {
        outCart("장바구니 제거하였습니다.");
        button.innerHTML = "장바구니 담기";
        button.dataset.include = "false";
    }
}


// 장바구니 추가 제거 요청 함수
function CartBtn(button) {
    const proNo = button.dataset.pno;
    const isInCart = button.dataset.include === "true"; // 기존 상태 저장
    addDeleteCart({
        proNo: proNo,
        inCart: isInCart // 변경 전 상태를 서버로 전송
    }, function (result) {
        changeCartStatus(result, button);
    });
}

// -------------------- 토스트 메시지 생성 함수 ---------------------
// 장바구니 추가
function inCart(message) {
    const toastContainer = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = 'inCart-toast-message';
    toast.textContent = message;
    toastContainer.appendChild(toast);

    // 강제로 reflow를 발생시켜 transition 적용
    void toast.offsetWidth;
    toast.classList.add('show');

    // 3초 후에 토스트 메시지 사라지게 함
    setTimeout(function() {
        toast.classList.remove('show');
        // 애니메이션 효과가 끝나면 DOM에서 제거
        setTimeout(function() {
            toastContainer.removeChild(toast);
        }, 300);
    }, 3000);
}

// 장바구니 제거
function outCart(message) {
    const toastContainer = document.getElementById('toast-container');
    const toast = document.createElement('div');
    toast.className = 'outCart-toast-message';
    toast.textContent = message;
    toastContainer.appendChild(toast);

    // 강제로 reflow를 발생시켜 transition 적용
    void toast.offsetWidth;
    toast.classList.add('show');

    // 3초 후에 토스트 메시지 사라지게 함
    setTimeout(function() {
        toast.classList.remove('show');
        // 애니메이션 효과가 끝나면 DOM에서 제거
        setTimeout(function() {
            toastContainer.removeChild(toast);
        }, 300);
    }, 3000);
}