<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/css/crm/productList.css">
    <link rel="stylesheet" href="/css/default.css">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
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
                    <path d="M11 19C15.4183 19 19 15.4183 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19Z" stroke="#7AC38F" stroke-linecap="round" stroke-linejoin="round"/>
                    <path d="M21.0004 21.0004L16.6504 16.6504" stroke="#7AC38F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
            </div>
            <div id="search_bar">
                <input id="search_bar_input" type="search" placeholder="상품, 카테고리 검색">
            </div>
        </div>

        <div></div>

    </div>
    <div id="list_content">
        <div class="product_table1">
            <c:forEach var="product" items="${productList}">
                <div class="product_table_inner">
                    <div data-toggle="modal" data-target="#myModal">
                        <div class="product_img">
                            <img src="${product.changeName}" alt="${product.proName}">
                        </div>
                        <div class="product_name">
                            <span>${product.proName}</span>
                            <span>${product.proPrice}원</span>
                        </div>
                    </div>

                    <div class="product_number">
                        <div class="product_number_inner">
                            <div class="number_button1"><input type="button" value="-"></div>
                            <div class="number"><input type="text" value="1"></div>
                            <div class="number_button2"><input type="button" value="+"></div>
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

<%--   두번째 테이블     --%>
        <div class="product_table1">

        </div>

<%--    paging bar    --%>
        <div id="pagingArea">
            <ul class="pagination">

                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                </c:forEach>

                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>
    </div>
<%--  productList modal  --%>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body">
                    <div id="sort"><img src="/image/productImgae/product1.png"></div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <div id="modal-footer-title"><span>1025 독도 앰플 45g</span></div>
                    <div id="modal-footer-note" class="modal-footer-font"><span>독도 앰플은 독도 100주년 기념하여 만든 앰플이며 피부에 아주 좋은 앰플입니다.</span></div>

                    <div id="modal-footer-both">
                        <div id="modal-footer-price"><span>15,600원</span></div>
                        <div><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>



<jsp:include page="../common/crm/footer.jsp"/>
</body>
</html>
