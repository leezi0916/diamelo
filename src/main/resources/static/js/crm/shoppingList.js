// 함수안에 넣으면 실행시점마다 초기화되서 밖으로 뻄
let sumTotalPrice = 0;
let sumTotalQuantity = 0;

function updateStock(price, stock) {
    // 총 구매 금액과 총 물품 개수 요소 가져오기
    const totalPrice = document.querySelector("#totalPrice");
    const totalQuantity = document.querySelector("#totalQuantity");

    // 이전 값(data-old)과 현재 입력된 값을 숫자로 변환
    const oldValue = parseInt(stock.dataset.old, 10); // 0
    const newValue = parseInt(stock.value, 10); // 증감된 수

    // 원래개수와 증가된 개수 차이 계산 (증가면 양수, 감소면 음수)
    const difference = newValue - oldValue;

    // 누적 변수 갱신
    sumTotalQuantity += difference;
    sumTotalPrice += difference * price;

    // data-old 값을 최신 값으로 업데이트
    stock.setAttribute('data-old', newValue);

    // 금액/개수 텍스트 요소에 값 반영
    totalQuantity.innerText = `총 물품 개수 : ${sumTotalQuantity}개`;
    totalPrice.innerText = `총 구매 금액 : ${sumTotalPrice.toLocaleString()}원`;
}

// Ajax 이용 delete
function deleteCart({proNo, inCart}, callback) {
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
    if (result === "Del") {
        outCart("장바구니 제거하였습니다.");
        const row = button.closest("tr");
        if (row) {
            row.remove();
        }

        // 장바구니가 완전히 비었는지 확인 -> 비어있을시 장바구니 추가 -> 제품 추가
        const shoppingListTr = document.querySelectorAll("#list_content table tr.table_header");
        if (shoppingListTr.length <= 1) {
            const buyButton = document.querySelector("#buy_button input[type='submit']");
            if (buyButton) {
                buyButton.type = "button";
                buyButton.value = "장바구니 추가";
                buyButton.onclick = function () {
                    location.href = "productList.crm";
                };
            }
        }
    }
}


// 장바구니 추가 제거 요청 함수
function CartBtn(button) {
    const proNo = button.dataset.pno;
    const isInCart = button.dataset.include === "true"; // 기존 상태 저장
    deleteCart({
        proNo: proNo,
        inCart: isInCart // 변경 전 상태를 서버로 전송
    }, function (result) {
        changeCartStatus(result, button);
    });
}

// -------------------- 토스트 메시지 생성 함수 ---------------------
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
    setTimeout(function () {
        toast.classList.remove('show');
        // 애니메이션 효과가 끝나면 DOM에서 제거
        setTimeout(function () {
            toastContainer.removeChild(toast);
        }, 300);
    }, 3000);
}