<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/crm/productList.css">
    <link rel="stylesheet" href="/css/default.css">

    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>Document</title>

</head>
<body>
<jsp:include page="../common/crm/header.jsp"/>

<div id="list">
    <div id="list_header">
        <div><span>상품 리스트</span></div>

        <div id="search">
            <div id="icon">
                <svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M11 19C15.4183 19 19 15.4183 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19Z"
                          stroke="#7AC38F" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M21.0004 21.0004L16.6504 16.6504" stroke="#7AC38F" stroke-width="2" stroke-linecap="round"
                          stroke-linejoin="round"/>
                </svg>
            </div>
            <div id="search_bar">
                <form action="searchList.pro">
                    <input id="search_bar_input" type="search" placeholder="상품, 카테고리 검색" name="keyword">
                </form>
            </div>
        </div>
        <div></div>

    </div>
    <div id="list_content">
        <div class="product_table1">
            <c:forEach var="product" items="${productList}" varStatus="status">
                <div class="product_table_inner">
                    <div data-toggle="modal" data-target="#productModal${status.index}">
                        <div class="product_img">
                            <img src="${product.changeName}" alt="${product.proName}">
                        </div>
                    </div>
                    <div class="product_name">
                        <span>${product.proName}</span>
                        <span>${product.proPrice}원</span>
                    </div>
                    <div class="product_addBtn">
                        <div class="product_addBtn_inner">
                            <div>
                                <%-- 장바구니 담겼는지 여부 --%>
                                <c:set var="isInCart" value="false" />
                                <c:forEach var="cart" items="${cartList}">
                                    <c:if test="${cart.proNo == product.proNo}">
                                        <c:set var="isInCart" value="true" />
                                    </c:if>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${isInCart}">
                                        <button data-pno="${product.proNo}" data-include="true" onclick="CartBtn(this)" id="deleteCart">장바구니 빼기</button>
                                    </c:when>
                                    <c:otherwise>
                                        <button data-pno="${product.proNo}" data-include="false" onclick="CartBtn(this)" id="addCart">장바구니 담기</button>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 모달 -->
                <div class="modal" id="productModal${status.index}">
                    <div class="modal-dialog">
                        <div class="modal-content">

                            <div class="modal-body">
                                <div id="sort"><img src="${product.changeName}" alt="${product.proName}"></div>
                            </div>

                            <div class="modal-footer">
                                <div id="modal-footer-title"><span>${product.proName}</span></div>
                                <div id="modal-footer-note" class="modal-footer-font"><span>${product.proDetail}</span>
                                </div>

                                <div id="modal-footer-both">
                                    <div id="modal-footer-price"><span>${product.proPrice}원</span></div>
                                    <div>
                                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <%--    paging bar    --%>
        <div id="pagingArea">
            <ul class="pagination">
                <c:choose>
                    <c:when test="${not empty searchLog}">
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="searchList.pro?cpage=${pi.currentPage - 1}">이전</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item"><a class="page-link"
                                                     href="searchList.pro?cpage=${p}&keyword=${param.keyword}"> ${p}</a>
                            </li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="searchList.pro?cpage=${pi.currentPage + 1}">다음</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:when>
                    <c:otherwise>
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="productList.crm?cpage=${pi.currentPage - 1}">이전</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item"><a class="page-link" href="productList.crm?cpage=${p}">${p}</a></li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link"
                                                         href="productList.crm?cpage=${pi.currentPage + 1}">다음</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>
    </div>
</div>
<jsp:include page="../common/crm/footer.jsp"/>

<%-- html이 다 그려지고 나서 실행되는 updatePwd.js --%>
<script src="/js/crm/productList.js"></script>

<!-- 페이지 최하단이나 body 마지막에 위치 -->
<div id="toast-container"></div>
</body>
</html>
