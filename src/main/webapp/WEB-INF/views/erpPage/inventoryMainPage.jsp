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
                <p><strong>번호:</strong> <span class="modal-number"></span></p>
                <p><strong>품목:</strong> <span class="modal-name"></span></p>
                <p><strong>분류:</strong> <span class="modal-category"></span></p>
                <p><strong>재고 수량:</strong> <span class="modal-quantity"></span></p>
                <p><strong>가격:</strong> <span class="modal-price"></span></p>
                <p><strong>비고:</strong> <span class="modal-description"></span></p>
            </div>

            <div class="modal-content-right">
                <div class="image-area">
                    <img src="/resources/image/productImgae/product1.png" alt="상품">
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



            <form id="page-body-content" action="search.pro" method="get">
                <div id="search-inventory">

                    <select name="searchCategory" id="search-category" class="select">
                        <option disabled selected>분류</option>
                        <option value="1">스킨</option>
                        <option value="2">로션</option>
                        <option value="3">선크림</option>
                        <option value="4">수분크림</option>
                        <option value="5">앰플</option>
                    </select>

                    <input type="text" placeholder="번호" id="search-number">

                    <input type="text" placeholder="제품명을 입력하세요." id="search-product">


                    <button id="searchBtn" type="submit">
                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z"
                                  fill="black"/>
                        </svg>
                        조회
                    </button>
                    <div id="add-btn-wrap">
                        <button id="addBtn" type="button" onclick="location.href='add.pro'">
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
                            <tr onclick="openModal(this)">
                                <td>${status.count}</td>
                                <td>${p.proName}</td>
                                <td>${p.categoryName}</td>
                                <td>${p.proInventStock}</td>
                                <td>${p.proPrice}</td>
                                <td>${p.proDetail}</td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href='update.pro'">
                                        <img src="/resources/image/update_icon.png" alt="수정" width="20">
                                    </button>
                                </td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href='delete.pro'">
                                        <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                                    </button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </form>

            <form id="page-body-content1" style="display: none" action="search.ing" method="get">

                <div id="search-inventory1">


                    <input type="text" placeholder="번호" id="search-number1">

                    <input type="text" placeholder="재료명을 입력하세요." id="search-product1">


                    <button id="searchBtn1" type="submit">
                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z"
                                  fill="black"/>
                        </svg>
                        조회
                    </button>
                    <div id="add-btn-wrap1">
                        <button id="addBtn1" type="button" onclick="location.href='add.ing'">
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
                            <tr onclick="openModal(this)">
                                <td>${status.count}</td>
                                <td>${p.proName}</td>
                                <td>${p.proInventStock}</td>
                                <td>${p.proPrice}</td>
                                <td>${p.proDetail}</td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href='update.ing'">
                                        <img src="/resources/image/update_icon.png" alt="수정" width="20">
                                    </button>
                                </td>
                                <td>
                                    <button class="icon-button" type="button" onclick="location.href='delete.ing'">
                                        <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                                    </button>
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                    </tbody>
                </table>
            </form>
        <div id="pagingArea">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                        <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="inv.erp?cpage=${pi.currentPage - 1}&tab=${param.tab}">이전</a>
                        </li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item">
                        <a class="page-link" href="inv.erp?cpage=${p}&tab=${param.tab}">${p}</a>
                    </li>
                </c:forEach>

                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item">
                            <a class="page-link" href="inv.erp?cpage=${pi.currentPage + 1}&tab=${param.tab}">다음</a>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
        </div>
    </div>
</div>
<script>
    document.getElementById("proBtn").addEventListener("click", function () {
        location.href = "inv.erp?cpage=1&tab=product"; // 제품 탭 클릭 시
    });

    document.getElementById("mtBtn").addEventListener("click", function () {
        location.href = "inv.erp?cpage=1&tab=material"; // 재료 탭 클릭 시
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


    <%-- modal --%>

    function openModal(row) {
        const modal = document.getElementById("productModal");
        // const modalNumber = modal.querySelector(".modal-number");
        const modalName = modal.querySelector(".modal-name");
        const modalCategory = modal.querySelector(".modal-category");
        const modalQuantity = modal.querySelector(".modal-quantity");
        const modalPrice = modal.querySelector(".modal-price");
        const modalDescription = modal.querySelector(".modal-description");

        // 행의 데이터를 가져오기
        const cells = row.getElementsByTagName("td");
        // modalNumber.textContent = cells[0].textContent;
        modalName.textContent = cells[1].textContent;
        modalCategory.textContent = cells[2].textContent;
        modalQuantity.textContent = cells[3].textContent;
        modalPrice.textContent = cells[4].textContent;
        modalDescription.textContent = cells[5].textContent;

        // 모달 표시
        modal.style.display = "block";

        // 닫기 버튼 기능 추가
        const closeButton = modal.querySelector(".close");
        closeButton.addEventListener("click", function () {
            modal.style.display = "none";
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener("click", function (event) {
            if (event.target === modal) {
                modal.style.display = "none";
            }
        });
    }


</script>
</body>
</html>
