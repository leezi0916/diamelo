<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Diamelo</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
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
                    <h2>메인 컨텐츠 들어갈 자리</h2>
                </div>
            </div>
        </div>
    </body>
</html>
