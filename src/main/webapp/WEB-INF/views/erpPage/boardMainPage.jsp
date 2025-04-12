<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="/css/erp/boardMainPageStyle.css" />
    <link rel="stylesheet" href="/css/default.css" />
</head>
<body>
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp" />

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp" />

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div class="page-body-header-text">
                        게시판
                </div>
            </div>


            <div id="page-body-content">
                <div id="search-board">
                    <form action="select.bo" method="get">
                        <select id="search-category" name="type">
                            <option value="0">전체</option>
                            <option value="1">공지</option>
                            <option value="2">문의</option>
                        </select>
                        <input type="text" placeholder="제목" id="search-title" name="title">
                        <input type="text" placeholder="작성자" id="search-user" name="userId">
                        <button id="searchBtn" type="submit">
                            <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
                            </svg>
                            조회
                        </button>
                    </form>
                    <div id="add-btn-wrap">
                        <button id="addBtn" type="button" onclick="location.href='enrollForm.bo'">
                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            게시글 작성
                        </button>
                    </div>
                </div>
                <table class="table table-hover" style="table-layout: fixed">
                    <thead>
                    <tr>
                        <th style="width: 10%">번호</th>
                        <th style="width: 18%">분류</th>
                        <th style="width: 21%">제목</th>
                        <th style="width: 12%">작성자</th>
                        <th style="width: 13%">작성일시</th>
                        <th style="width: 8%">수정</th>
                        <th style="width: 8%">삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${not empty list1}">
                            <c:forEach var="c" items="${list1}">
                                <tr>
                                    <td onclick="location.href='detail.bo?bno=${c.postId}'">${c.postId}</td>
                                    <td onclick="location.href='detail.bo?bno=${c.postId}'">
                                            <c:choose>
                                                <c:when test="${c.type == '1'}">
                                                    공지사항
                                                </c:when>
                                                <c:otherwise>
                                                    문의사항
                                                </c:otherwise>
                                            </c:choose>
                                    </td>
                                    <td onclick="location.href='detail.bo?bno=${c.postId}'">${c.title}</td>
                                    <td onclick="location.href='detail.bo?bno=${c.postId}'">${c.userId}</td>
                                    <td onclick="location.href='detail.bo?bno=${c.postId}'">${c.createdDate}</td>
                                    <td>
                                    <c:if test="${c.userId == loginUser.userId}">
                                            <button class="icon-button" type="button" onclick="location.href='updateForm.bo?bno=${c.postId}'">
                                                <img  src="/image/update_icon.png" alt="수정" width="20">
                                            </button>
                                    </c:if>
                                    </td>
                                    <td>
                                        <c:if test="${c.userId == loginUser.userId or loginUser.jobCode eq 'J5'}">
                                            <form action="delete.bo" method="get" name="deleteBoard">
                                                <input type="hidden" name="postId" value="${c.postId}">
                                                <button class="icon-button" type="submit" onclick="return confirm('정말 삭제하시겠습니까??')">
                                                    <img src="/image/delete_icon.png" alt="삭제" width="20">
                                                </button>
                                            </form>
                                        </c:if>
                                    </td>

                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr><td colspan="7"><h3>게시판이 없습니다.</h3></td></tr>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
            </div>

            <c:set var="isSearch" value="false" />
            <c:if test="${not empty type and type ne 0}">
                <c:set var="isSearch" value="true" />
            </c:if>
            <c:if test="${not empty title}">
                <c:set var="isSearch" value="true" />
            </c:if>
            <c:if test="${not empty userId}">
                <c:set var="isSearch" value="true" />
            </c:if>

            <c:choose>
                <c:when test="${isSearch}">
                    <div id="pagingArea">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="select.bo?bpage=${pi.currentPage - 1}&type=${type}&title=${title}&userId=${userId}">이전</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item"><a class="page-link" href="select.bo?bpage=${p}&type=${type}&title=${title}&userId=${userId}">${p}</a></li>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="select.bo?bpage=${pi.currentPage + 1}&type=${type}&title=${title}&userId=${userId}">다음</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="pagingArea">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="board.erp?bpage=${pi.currentPage - 1}">이전</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item"><a class="page-link" href="board.erp?bpage=${p}">${p}</a></li>
                            </c:forEach>

                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="board.erp?bpage=${pi.currentPage + 1}">다음</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </c:otherwise>
            </c:choose>
            </div>
        </div>
    </div>
</body>
</html>
