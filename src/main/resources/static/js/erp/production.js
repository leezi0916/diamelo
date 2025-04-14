// 첫 로딩시
$(document).ready(function () {
    // 처음 로딩 시 수량 입력 필드를 비활성화
    $("#amount-input").prop("readonly", true);

    $("#product-select1").change(function () {
        let selectedProductNo = $(this).val();
        $("#amount-input").val(''); // 수량 초기화

        if (selectedProductNo) {
            $("#amount-input").prop("readonly", false); // 제품 선택 시 입력 가능
        } else {
            $("#amount-input").prop("readonly", true); // 제품 선택 안 하면 다시 비활성화
        }
    });

});

// select 누를시 제품의 맞는 이미지와 레시피 재료정보
$(document).ready(function () {
    $("#product-select1").change(function () {
        let selectedProductNo = $(this).val();

        // 수량 입력 필드 초기화
        $("#amount-input").val('');

        if (selectedProductNo) {
            $.ajax({
                url: "/api/production/details",
                method: "GET",
                data: {productNo: selectedProductNo},
                success: function (response) {
                    console.log(response); // 응답 데이터 확인

                    let materialList = response.materials; // 재료 목록
                    let imagePath = response.imagePath; // 제품 이미지
                    let materialTableBody = $("#material-list");
                    let maxCount = response.maxCount;

                    // $("#max-count").text(maxCount); // 최대 생산 수량 표시
                    if (maxCount != null) {
                        $("#max-count").text(maxCount); // 0도 포함해서 표시
                        $("#max-count-wrapper").show(); // 항상 보이게
                    } else {
                        $("#max-count-wrapper").hide(); // null일 경우만 숨김
                    }

                    // 제품 이미지 업데이트
                    if (imagePath) {
                        $("#product-img").attr("src", imagePath).show();
                    } else {
                        $("#product-img").hide();
                    }

                    // 기존 테이블 초기화
                    materialTableBody.empty();

                    // 재료가 없을 경우
                    if (materialList.length === 0) {
                        materialTableBody.append("<tr><td colspan='3'>등록된 레시피가 없습니다.</td></tr>");
                        return;
                    }
                    console.log(materialList);


                    //  새로운 데이터 추가
                    materialList.forEach(function (material) {
                        console.log(material); // 각 재료 데이터가 정상적으로 출력되는지 확인

                        let row = "<tr>" +
                            "<td>" + material.proNo + "</td>" +
                            "<td>" + material.proName + "</td>" +
                            "<td>" + (material.amount ? material.amount + ' g' : '정보 없음') + "</td>" +
                            "</tr>";

                        materialTableBody.append(row); // 테이블에 추가
                    });
                },
                error: function () {
                    alert("레시피 정보를 불러오는 데 실패했습니다.");
                }
            });
        } else {
            // 제품이 선택되지 않으면 기본 메시지 표시
            $("#material-list").html('<tr><td colspan="3">제품을 선택하면 필요한 재료가 표시됩니다.</td></tr>');
            $("#product-img").hide();
            $("#max-count-wrapper").hide();
        }
    });
});

// 제품 및 수량입력 안하고 제작 버튼 클릭시 메세지
$(document).ready(function () {
    $("#produce-btn").click(function (event) {
        let selectedProductNo = $("#product-select1").val();
        let quantity = $("#amount-input").val();

        if (!selectedProductNo) {
            alert("제품을 선택하세요!");
            event.preventDefault(); // 폼 제출 방지
            return false;
        }

        if (!quantity || quantity <= 0) {
            alert("수량을 입력하세요!");
            event.preventDefault(); // 폼 제출 방지
            return false;
        }
    });
});

