<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/inventoryMainPageStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
</head>
<body>
<c:if test="${not empty sessionScope.alertMsg}">
    <script>
        alert('${sessionScope.alertMsg}');
    </script>
    <c:remove var="alertMsg" scope="session"/>
</c:if>

<div id="productModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <div class="modal-content-upper">
            <div class="modal-content-left">
                <h2>상품 상세 정보</h2>
                <br>
                <p><strong>상품번호 : </strong> <span class="modal-number"></span></p>
                <p><strong>품목 : </strong> <span class="modal-name"></span></p>
                <p><strong>분류 : </strong> <span class="modal-category"></span></p>
                <p><strong>재고 수량 : </strong> <span class="modal-quantity"></span></p>
                <p><strong>가격 : </strong> <span class="modal-price"></span></p>
                <p><strong>비고 : </strong> <span class="modal-description"></span></p>
            </div>
            <div class="modal-content-right">
                <img class="modal-image-tag" src="" alt="상품 이미지" style="max-width: 80%; max-height: 500px">
            </div>
        </div>
    </div>
</div>
</div>

<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp"/>

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div class="page-body-header-text">
                    <button id="proBtn">
                        제품 (${pCount})
                    </button>
                </div>
                <div class="page-body-header-text">
                    <button id="mtBtn" >
                        재료 (${mCount})
                    </button>
                </div>
            </div>




            <form id="page-body-content" action="productSearch.pro" method="get">
                <div id="search-inventory">

                    <select name="searchCategoryNo" id="search-category" class="select">
                        <option value="0" ${searchCategoryNo == null ? 'selected' : ''}>전체</option>
                        <option value="1" ${searchCategoryNo == 1 ? 'selected' : ''}>스킨</option>
                        <option value="2" ${searchCategoryNo == 2 ? 'selected' : ''}>로션</option>
                        <option value="3" ${searchCategoryNo == 3 ? 'selected' : ''}>선크림</option>
                        <option value="4" ${searchCategoryNo == 4 ? 'selected' : ''}>수분크림</option>
                        <option value="5" ${searchCategoryNo == 5 ? 'selected' : ''}>앰플</option>
                    </select>

                    <input type="text" placeholder="번호" id="search-number" name="proNo" value="${proNo != 0 ? proNo : ''}">

                    <input type="text" placeholder="제품명을 입력하세요." id="search-product" name="proName" value="${proName != null ? proName : ''}">


                    <button id="searchBtn" type="submit">
                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z"
                                  fill="black"/>
                        </svg>
                        조회
                    </button>
                    <div id="add-btn-wrap">
                        <button id="addBtn" type="button" onclick="location.href='insertProduct.pro'">
                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white"
                                      stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>

                            제품 등록
                        </button>
                    </div>
                </div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>품목</th>
                        <th>분류</th>
                        <th>재고 수량(단위:EA)</th>
                        <th>가격</th>
                        <th>비고</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>

                    <c:forEach var="p" items ="${list}" varStatus="status">
                        <c:if test="${p.isProduct =='Y'}">
                            <tr class="product-row">
                                <td>${status.count}</td>
                                <td>${p.proName}</td>
                                <td>${p.categoryName}</td>
                                <td>${p.proInventStock}</td>
                                <td>${p.proPrice}</td>
                                <td>${p.proDetail}</td>
                                <td style="display: none">${p.changeName}</td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href = '/updateView.pro?proNo=${p.proNo}';">
                                        <img src="/image/update_icon.png" alt="수정" width="20">
                                    </button>
                                </td>
                                <td>
                                    <button class="icon-button" type="button" onclick="confirmDelete(${p.proNo}, '/delete.pro')">
                                        <img src="/image/delete_icon.png" alt="삭제" width="20">
                                    </button>
                                </td>


                                <!-- 숨겨진 데이터들 -->
                                <td style="display:none;">
                                    <span class="modal-proNo">${p.proNo}</span>
                                    <span class="modal-proName">${p.proName}</span>
                                    <span class="modal-categoryName">${p.categoryName}</span>
                                    <span class="modal-proInventStock">${p.proInventStock}EA</span>
                                    <span class="modal-proPrice">${p.proPrice}원</span>
                                    <span class="modal-proDetail">${p.proDetail}</span>
                                    <span class="modal-image">${p.changeName}</span>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </form>

            <form id="page-body-content1" style="display: none" action="ingredientSearch.ing" method="get">

                <div id="search-inventory1">


                    <input type="text" placeholder="번호" id="search-number1" name="proNo" value="${proNo != 0 ? proNo : ''}">

                    <input type="text" placeholder="재료명을 입력하세요." id="search-product1" name="proName" value="${proName != null ? proName : ''}">


                    <button id="searchBtn1" type="submit">
                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z"
                                  fill="black"/>
                        </svg>
                        조회
                    </button>
                    <div id="add-btn-wrap1">
                        <button id="addBtn1" type="button" onclick="location.href='insert.ing'" >
                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white"
                                      stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>

                            재료 등록
                        </button>
                    </div>
                </div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th>번호</th>
                        <th>품목</th>
                        <th>재고 수량(단위:g)</th>
                        <th>가격</th>
                        <th>비고</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="p" items ="${list}" varStatus="status">
                        <c:if test="${p.isProduct == 'N'}">
                            <tr class="product-row">
                                <td>${status.count}</td>
                                <td>${p.proName}</td>
                                <td>${p.proInventStock}</td>
                                <td>${p.proPrice}</td>
                                <td>${p.proDetail}</td>
                                <td style="display: none" >${p.changeName}</td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href = '/updateView.ing?proNo=${p.proNo}';">
                                        <img src="/image/update_icon.png" alt="수정" width="20">
                                    </button>
                                </td>
                                <td>
                                    <button class="icon-button" type="button" onclick="confirmDelete(${p.proNo}, '/delete.ing')">
                                        <img src="/image/delete_icon.png" alt="삭제" width="20">
                                    </button>
                                </td>


                                <!-- 숨겨진 데이터들 -->
                                <td style="display:none;">
                                    <span class="modal-proNo">${p.proNo}</span>
                                    <span class="modal-proName">${p.proName}</span>
                                    <span class="modal-categoryName">${p.categoryName}</span>
                                    <span class="modal-proInventStock">${p.proInventStock}g</span>
                                    <span class="modal-proPrice">${p.proPrice}원</span>
                                    <span class="modal-proDetail">${p.proDetail}</span>
                                    <span class="modal-image">${p.changeName}</span>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </form>




            <c:choose>
                <c:when test="${tab == 'product'}">
                    <c:choose>
                        <c:when test="${not empty searchCategoryNo or not empty proNo or not empty proName}">
                            <c:url var="pageUrl" value="productSearch.pro">
                                <c:param name="tab" value="${tab}" />
                                <c:param name="searchCategoryNo" value="${searchCategoryNo}" />
                                <c:param name="proNo" value="${proNo}" />
                                <c:param name="proName" value="${proName}" />
                            </c:url>
                        </c:when>
                        <c:otherwise>
                            <c:url var="pageUrl" value="productSearch.pro">
                                <c:param name="tab" value="product" />
                            </c:url>
                        </c:otherwise>
                    </c:choose>
                </c:when>

                <c:when test="${tab == 'material'}">
                    <c:choose>
                        <c:when test="${not empty proNo or not empty proName}">
                            <c:url var="pageUrl" value="ingredientSearch.ing">
                                <c:param name="tab" value="${tab}" />
                                <c:param name="proNo" value="${proNo}" />
                                <c:param name="proName" value="${proName}" />
                            </c:url>
                        </c:when>
                        <c:otherwise>
                            <c:url var="pageUrl" value="ingredientSearch.ing">
                                <c:param name="tab" value="material" />
                            </c:url>
                        </c:otherwise>
                    </c:choose>
                </c:when>

                <c:otherwise>
                    <c:set var="pageUrl" value="inv.erp?" />
                </c:otherwise>
            </c:choose>


            <div id="pagingArea">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${pageUrl}&cpage=${pi.currentPage - 1}">이전</a>
                            </li>
                        </c:otherwise>
                    </c:choose>

                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item">
                            <a class="page-link" href="${pageUrl}&cpage=${p}">${p}</a>
                        </li>
                    </c:forEach>

                    <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item">
                                <a class="page-link" href="${pageUrl}&cpage=${pi.currentPage + 1}">다음</a>
                            </li>
                        </c:otherwise>
                    </c:choose>
                </ul>
            </div>
        </div>
    </div>
</div>
<script>
    // 제품 탭, 재료 탭 기능
    document.getElementById("proBtn").addEventListener("click", function () {
        location.href = "inv.erp?&cpage=1&tab=product"; // 제품 탭 클릭 시
    });

    document.getElementById("mtBtn").addEventListener("click", function () {
        location.href = "inv.erp?&cpage=1&tab=material"; // 재료 탭 클릭 시
    });
    // URL에서 tab 값 가져오기
    const urlParams = new URLSearchParams(window.location.search);
    const tab = urlParams.get('tab') || 'product';  // 기본값: 제품

    if (tab === 'product') {
        document.getElementById("proBtn").style.color = "#A9A9A9";
        document.getElementById("mtBtn").style.color = "black";
        document.getElementById("page-body-content").style.display = "block";
        document.getElementById("page-body-content1").style.display = "none";

    } else {
        document.getElementById("mtBtn").style.color = "#A9A9A9";
        document.getElementById("proBtn").style.color = "black";
        document.getElementById("page-body-content1").style.display = "block";
        document.getElementById("page-body-content").style.display = "none";

    }
    if(tab === 'product'){
        document.getElementById('page-body-content').addEventListener('submit', function (e) {
            e.preventDefault(); // 기본 제출 막기
            console.log(tab);
            const form = e.target;
            const url = new URL(form.action, window.location.origin);
            url.searchParams.set('tab', 'product'); // tab 값 추가
            const formData = new FormData(form);
            for (const [key, value] of formData.entries()) {
                url.searchParams.set(key, value);
            }

            // 이동
            window.location.href = url.toString();
        });
    }else{
        document.getElementById('page-body-content1').addEventListener('submit', function (e) {
            e.preventDefault(); // 기본 제출 막기
            console.log(tab);
            const form = e.target;
            const url = new URL(form.action, window.location.origin);
            url.searchParams.set('tab', 'material'); // tab 값 추가
            const formData = new FormData(form);
            for (const [key, value] of formData.entries()) {
                url.searchParams.set(key, value);
            }

            // 이동
            window.location.href = url.toString();
        });
    }
    // document.getElementById('page-body-content1').addEventListener('submit', function (e) {
    //     e.preventDefault(); // 기본 제출 막기
    //     console.log(tab);
    //     const form = e.target;
    //     const url = new URL(form.action, window.location.origin);
    //
    //     if(tab === 'material'){
    //         url.searchParams.set('tab', 'product'); // tab 값 추가
    //     }else{
    //         url.searchParams.set('tab', 'material'); // tab 값 추가
    //     }

    //
    // const form = e.target;
    // const url = new URL(form.action, window.location.origin);
    // url.searchParams.set('tab', 'material'); // tab 값 추가


    // if(tab === 'product'){
    //     const form = e.target;
    //     const url = new URL(form.action, window.location.origin);
    //     url.searchParams.set('tab', 'product'); // tab 값 추가
    // }else{
    //     const form = e.target;
    //     const url = new URL(form.action, window.location.origin);
    //     url.searchParams.set('tab', 'material'); // tab 값 추가
    // }


    // 폼 데이터를 붙이기
    // const formData = new FormData(form);
    // for (const [key, value] of formData.entries()) {
    //     url.searchParams.set(key, value);
    // }
    //
    // // 이동
    // window.location.href = url.toString();

    // 제품,재료 리스트 행 클릭 시 모달로 상세 내용 및 이미지 보여주기
    $(".product-row").click(function () {
        const row = $(this);
        $(".modal-number").text(row.find(".modal-proNo").text());
        $(".modal-name").text(row.find(".modal-proName").text());
        $(".modal-category").text(row.find(".modal-categoryName").text());
        $(".modal-quantity").text(row.find(".modal-proInventStock").text());
        $(".modal-price").text(row.find(".modal-proPrice").text());
        $(".modal-description").text(row.find(".modal-proDetail").text());
        // 이미지 처리
        const imagePath = row.find(".modal-image").text();
        $(".modal-image-tag").attr("src", imagePath);

        $(".modal").fadeIn();
    });

    // 모달 닫기 이벤트
    document.querySelector(".close").onclick = function() {
        document.getElementById("productModal").style.display = "none";
    }
    // 모달 바깥 클릭 시 닫기
    window.onclick = function(event) {
        const modal = document.getElementById("productModal");
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }


    // 제품, 재료 삭제할 시
    function confirmDelete(proNo, actionUrl) {
        if (confirm('정말로 삭제하시겠습니까?')) {
            const form = document.createElement('form');
            form.method = 'post';
            form.action = actionUrl;

            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = 'proNo';
            input.value = proNo;
            form.appendChild(input);

            document.body.appendChild(form);
            form.submit();
        }
    }

</script>
</body>
</html>
