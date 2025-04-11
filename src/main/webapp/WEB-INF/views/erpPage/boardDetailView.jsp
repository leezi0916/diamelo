<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/erp/boardDetailViewStyle.css"/>
    <script src="/js/erp/boardDetailView.js"></script>
</head>
<body onload="init('${b.postId}')">
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
                        게시글 보기
                    </div>
                </div>

                <div id="page-body-content">
                        <div id="header">
                            <div id="category">
                                <div id="category0">
                                    <c:choose>
                                        <c:when test="${b.type == '1'}">
                                            공지사항
                                        </c:when>
                                        <c:otherwise>
                                            문의사항
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>
                            <div id="title">
                                <div id="title0">제목</div>
                                <div id="title1"><input type="text" readonly value="${b.title}"></div>
                            </div>
                            <div id="userId">
                                <div id="userId0">작성자</div>
                                <div><input type="text" readonly placeholder="${b.userId}"></div>
                            </div>
                        </div>

                        <div id="content">
                            <div id="content-name">내용</div>
                            <div id="content-input">
                                <textarea readonly>${b.content}</textarea>
                            </div>
                        </div>

                        <div id="reply">
                            <div id="reply1">
                                <div id="reply-name">댓글 달기</div>
                                <div id="replyBtn">
                                    <input type="hidden" id="data" data-postId="${b.postId}" data-loginUser="${loginUser.userId}" data-jobCode="${loginUser.jobCode}">
                                    <button id="addBtn" onclick="addReply('${loginUser.userId}', '${b.postId}')">댓글 작성</button>
                                </div>
                            </div>
                            <div id="reply2">
                                <div id="reply-input">
                                    <textarea id="reply-text" name="textarea"></textarea>
                                </div>
                            </div>
                        </div>
                </div>

                <div id="reply-content">
                    <div id="reply-header"><h4>댓글(<span id="rCount">0</span>)</h4></div>
                    <div id="reply-inner"></div>
                </div>

                <div id="page-body-backBtn-div">
                    <button id="backBtn" type="button" onclick="location.href='board.erp'">뒤로 가기</button>
                </div>
            </div>
        </div>
    </div>

</div>



</body>
</html>
