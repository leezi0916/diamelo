<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/incomePage.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css"/>

    <script src="/js/erp/dateSelect.js"></script>

    <title>Title</title>
</head>
<body>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp"/>



        <!-- 페이지 본문 -->
        <div class="page-body">
            <%-- 페이지 제목 영역 --%>
            <div class="page-body-header">
                <div id="page-body-header-text">
                    매출내역 (<c:out value="${incomeCount}"/>)
                </div>
            </div>
            <%-- 검색 필터 + 테이블 리스트 영역 --%>
            <div class="page-body-content">
                <%-- 검색 필터 영역 --%>
                <div id="page-body-content-search-button">

                    <form action="search.in" method="get" class="search-form">
                        <select class="input-box" name="type">
                            <option value="" selected>전체</option>
                            <option value="I" ${type == 'I' ? 'selected' : ''}>소득</option>
                            <option value="O" ${type == 'O' ? 'selected' : ''}>지출</option>
                        </select>

                        <input type="date" name="date1" value="${startDate}" id="startDate" class="input-box">
                        <input type="date" name="date2" value="${endDate}" id="endDate" class="input-box">

                        <input type="text" name="company" value="${company}" class="input-box" placeholder="거래처">
                        <%-- 검색 버튼(아이콘 + 텍스트포함) --%>
                        <button type="submit" class="input-box" onclick="return checkDate()">
                            <svg width="25" height="25" viewBox="0 0 25 25" fill="none"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd"
                                      d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z"
                                      fill="black"/>
                            </svg>
                            조회
                        </button>
                    </form>

                </div>
                <%-- 판매 내역 테이블 영역 --%>
                <div id="page-body-content-search-list">
                    <table class="table table-hover">
                        <thead>
                        <tr>
                            <th>매출내역번호</th>
                            <th>거래처</th>
                            <th>분류</th>
                            <th>매출 일자</th>
                            <th>매출/매입</th>
                        </tr>
                        </thead>
                        </tbody>
                        <c:choose>
                            <c:when test="${not empty list}">
                                <c:forEach var="item" items="${list}">
                                    <tr onclick="location.href='detail.in?gno=${item.groupNo}'">
                                    <td>${item.groupNo}</td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.companyName == null}">
                                                    A공장
                                                </c:when>
                                                <c:otherwise>
                                                    ${item.companyName}
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${item.type eq 'I'}">소득</c:when>
                                                <c:otherwise>지출</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>${item.salesDate}</td>
                                        <td style="font-weight: 500; color: ${item.type eq 'I' ? 'blue' : 'red'};">
                                            <c:choose>
                                                <c:when test="${item.type eq 'I'}">+<fmt:formatNumber value="${item.totalSales}" type="number"/></c:when>
                                                <c:otherwise> -<fmt:formatNumber value="${item.totalSales}" type="number"/></c:otherwise>
                                            </c:choose>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" style="text-align:center;">정보가 없습니다.</td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                        </tbody>
                    </table>
                </div>
            </div>
                <%-- 검색 필터 + 테이블 리스트 영역 --%>
                <div class="page-body-content2">
                    <%-- 매출 합계 조회 영역 --%>
                    <div id="table-header">
                        <c:choose>
                            <c:when test="${empty param.type}">
                                <div id="table-header-title" class="table-header">매출 총이익</div>
                                    <div id="table-header-price" class="table-header" style="font-weight: bold;">
                                        <fmt:formatNumber value="${details}" type="number"/>
                                    </div>
                                <div id="table-header-unit" class="table-header">(단위:만원)</div>
                            </c:when>
                            <c:when test="${type == 'I'}">
                                <div id="table-header-title" class="table-header">총 매출</div>
                                    <div id="table-header-price" class="table-header" style="color: blue; font-weight: bold;">
                                        +<fmt:formatNumber value="${totalSalesSum}" type="number"/>
                                    </div>
                                <div id="table-header-unit" class="table-header">(단위:만원)</div>
                            </c:when>
                            <c:when test="${type == 'O'}">
                                <div id="table-header-title" class="table-header">총 지출</div>
                                    <div id="table-header-price" class="table-header" style="color: red; font-weight: bold;">
                                        -<fmt:formatNumber value="${totalSalesSum}" type="number"/>
                                    </div>
                                <div id="table-header-unit" class="table-header">(단위:만원)</div>
                            </c:when>
                        </c:choose>
                    </div>
                </div>


                <%-- 검색 조건을 URL로 넘기기 위해 pageUrl 구성 --%>
                <c:choose>
                    <c:when test="${not empty type or not empty startDate or not empty endDate or not empty company}">
                        <c:url var="pageUrl" value="search.in">
                            <c:param name="type" value="${type}" />
                            <c:param name="date1" value="${startDate}" />
                            <c:param name="date2" value="${endDate}" />
                            <c:param name="company" value="${company}" />
                        </c:url>
                    </c:when>
                    <c:otherwise>
                        <c:set var="pageUrl" value="income.erp?" />
                    </c:otherwise>
                </c:choose>


                <div id="pagingArea">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${pi.currentPage eq 1}">
                                <li class="page-item disabled"><a class="page-link" href="#">이전</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="${pageUrl}&inpage=${pi.currentPage - 1}">이전</a>
                                </li>
                            </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                            <li class="page-item">
                                <a class="page-link" href="${pageUrl}&inpage=${p}">${p}</a>
                            </li>
                        </c:forEach>

                        <c:choose>
                            <c:when test="${pi.currentPage eq pi.maxPage}">
                                <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item">
                                    <a class="page-link" href="${pageUrl}&inpage=${pi.currentPage + 1}">다음</a>
                                </li>
                            </c:otherwise>
                        </c:choose>
                    </ul>
                </div>



    </div>
</div>
</body>
</html>
