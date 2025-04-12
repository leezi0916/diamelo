<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <title>header</title>

        <%-- Noto Sans KR Font--%>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
            rel="stylesheet"
        />

        <!-- JavaScript -->
        <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/alertify.min.js"></script>

        <!-- CSS -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css" />
        <!-- Default theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/default.min.css" />
        <!-- Semantic UI theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/semantic.min.css" />
        <!-- Bootstrap theme -->
        <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/themes/bootstrap.min.css" />

        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />

        <!-- jQuery library -->
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

        <script src="/js/erp/header.js"></script>
        <style>
            #pagingArea{
                padding: 20px;
            }

            #pagingArea ul{
                margin: 0;
            }
            .page-item.disabled .page-link{
                background: #f8f8f8;
                border: 1px solid #A9A9A9;
            }

            .page-link{
                color: black;
                background: #f8f8f8;
                border: 1px solid #A9A9A9;
            }

            .page-link:hover{
                background: #E4E4E4;
                color: black;
                border: 1px solid #A9A9A9;
            }
        </style>
    </head>
    <body>
        <c:if test="${ not empty alertMsg}">
            <script>
                alert("${alertMsg}");
            </script>
            <c:remove var="alertMsg" scope="session"/>
        </c:if>

        <div class="header-container">
            <!-- 왼쪽: HOME 아이콘 + 텍스트 -->
            <div class="header-left">
                <%-- 타이틀마다의 아이콘 --%>
                <img src="${selectIcon}">
                <%-- 타이틀 명 --%>
                <div class="home-labels">
                    <span class="home-sub">
                            ${seletTitle}
                    </span>
                    <span class="home-main">${seletTitle}</span>
                </div>
            </div>

            <!-- 오른쪽: 사람 아이콘 + 로그아웃 아이콘 + 텍스트 -->
            <div class="header-right">

                <%-- 구매창으로 돌아가기 --%>
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg" onclick="backCrmPage()">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M19.8281 3.65625L5.09481 14.2463V36.3446H16.5931V27.8796H23.4631V36.3446H34.9048V14.2413L19.8281 3.65625Z" fill="#7AC38F"/>
                </svg>


                <!-- 로그아웃 아이콘 -->
                <svg
                    width="35"
                    height="34"
                    viewBox="0 0 35 34"
                    fill="none"
                    xmlns="http://www.w3.org/2000/svg"
                    onclick="logout()"
                >
                    <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M27.3846 9.77433L25.6212 11.546L29.8446 15.7493H19.5079V18.2493H29.8446L25.6212 22.456L27.3862 24.2277L34.6446 16.9993L27.3846 9.77433Z"
                        fill="#7AC38F"
                    />
                    <path
                        fill-rule="evenodd"
                        clip-rule="evenodd"
                        d="M9.07526 15.75L19.5079 15.7493L19.5086 0.75H0.308594V33.25H19.5086L19.5079 18.2493L9.07526 18.25V15.75Z"
                        fill="#7AC38F"
                    />
                </svg>

                <!-- 텍스트 -->
                <span class="welcome-text">${loginUser.userName} 님 어서오세요!</span>
            </div>
        </div>
    </body>
</html>
