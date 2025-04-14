// document.addEventListener('DOMContentLoaded', () => {
// 계산 결과를 출력할 DOM 요소들
    const inputs = document.querySelectorAll('.order-input');
    const detailsEl = document.getElementById('order-details');
    const itemCountEl = document.getElementById('itemsCount');
    const totalQtyEl = document.getElementById('totalQty');
    const totalPriceEl = document.getElementById('totalPrice');


    const hiddenItemsCount = document.getElementById('hiddenItemsCount');
    const hiddenTotalQty = document.getElementById('hiddenTotalQty');
    const hiddenTotalPrice = document.getElementById('hiddenTotalPrice');
    const hiddenOrderDetails = document.getElementById('hiddenOrderDetails');

// 수량 입력 시 호출되는 함수
    function updateSummary() {
        let totalItems = 0;
        let totalQty = 0;
        let totalPrice = 0;
        let detailsHtml = '';
        let orderDetailsArray = []; // 각 항목의 상세 정보를 객체 배열로 저장

        inputs.forEach(input => {
            const qty = parseInt(input.value) || 0;
            const proNo = parseInt(input.getAttribute('data-proNo'));
            const name = input.getAttribute('data-name');
            const price = parseInt(input.getAttribute('data-price'));


            if (qty > 0) {
                const itemTotal = qty * price;
                // console.log("이름:", name, "수량:", qty, "단가:", price,  "제품번호 :", proNo );
                // console.log("proNo:", proNo, "name:", name, "qty:", qty, "price:", price);
                // console.log(`🟡 제품명(proName): ${name}, 제품번호(proNo): ${proNo}`);
                totalItems += 1;
                totalQty += qty;
                totalPrice += itemTotal;

                detailsHtml +=
                    "<tr class='page-body-content-material-list-last'>" +
                    "<td colspan='2'>" + name + "</td>" +
                    "<td colspan='2'>" + qty + "</td>" +
                    "<td colspan='2'>" + itemTotal + "<td>" +
                    "<td colspan='2'>" + proNo + "</td>" +
                    "</tr>";

                orderDetailsArray.push({proName: name, proNo: proNo, qty: qty, itemTotal: itemTotal});

            }
        });

        itemCountEl.textContent = totalItems;
        totalQtyEl.textContent = totalQty;
        totalPriceEl.textContent = totalPrice.toLocaleString();
        detailsEl.innerHTML = detailsHtml;

        hiddenItemsCount.value = totalItems;
        hiddenTotalQty.value = totalQty;
        hiddenTotalPrice.value = totalPrice;
        hiddenOrderDetails.value = JSON.stringify(orderDetailsArray);


    }

// 모든 input에 이벤트 리스너 등록
    inputs.forEach(input => {
        input.addEventListener('input', updateSummary);
    });
    document.getElementById('order-details').innerHTML = "<tr><td colspan='6'>테스트 데이터</td></tr>";
// 페이지 로딩 시 초기 계산 실행
    updateSummary();
// });