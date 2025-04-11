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