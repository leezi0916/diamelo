<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="/css/erp/erpLayout.css"/>
        <link rel="stylesheet" href="/css/erp/erpLayout.css" />
        <link rel="stylesheet" href="/css/default.css" />
        <meta charset="UTF-8" />
        <title>ErrorPage</title>
    </head>
    <body>

    <div class="layout-wrapper">
        <!-- 왼쪽 고정 사이드바 -->
        <jsp:include page="../erp/header.jsp"/>

        <!-- 오른쪽 상단바 + 콘텐츠 -->
        <div class="main-area">
            <jsp:include page="../erp/sidebar.jsp" />

            <br>
            <div align="center">
                <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-256.png"/>
                <br><br>
                <h1 style="font-weight: bold; color: red">${errorMsg}</h1>
            </div>
            <br>

        </div>
    </div>
    </body>
</html>
