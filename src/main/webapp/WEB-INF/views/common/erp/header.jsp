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


                <c:choose>
                    <c:when test="${eno eq 1}">
                        <!-- 홈 아이콘 -->
                        <svg width="25" height="22" viewBox="0 0 25 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.5 3.48118L18.75 9.30471V19.4118H16.25V11.6471H8.75V19.4118H6.25V9.30471L12.5 3.48118ZM12.5 0L0 11.6471H3.75V22H11.25V14.2353H13.75V22H21.25V11.6471H25L12.5 0Z" fill="black"/>
                        </svg>
                    </c:when>
                    <c:when test="${eno eq 2}">
                        <%-- 재고 아이콘 --%>
                        <svg width="25"
                                height="25"
                                viewBox="0 0 25 25"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect width="25" height="25" fill="url(#pattern0_240_5965)" />
                            <defs>
                                <pattern id="pattern0_240_5965"
                                        patternContentUnits="objectBoundingBox"
                                        width="1"
                                        height="1">
                                    <use xlink:href="#image0_240_5965" transform="scale(0.0104167)" />
                                </pattern>
                                <image id="image0_240_5965"
                                        width="96"
                                        height="96"
                                        preserveAspectRatio="none"
                                        xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACIElEQVR4nO2bTU4CURCEa6FnEa8qIKdB76FcRGAlizKTjIkbfgbes7ua+pJeGqq6hpF0vwcYY4wxxhhjjDHGGNOOZwCvADYA9gCYvPYAPgEsAcyUH4RHACsAhwRN5ZV1GIN4gGDz3xM0kI3qTS2EVYKmsXEN3wSZd77ya4dHavD0BAEqPv0cawEBNgkaxU41/DpKzy5Bo9ipthDgnInsUFy/vAGK65c3QHH98gYorl/eAMX1yxuguH55AxTXL2+A4vqbG+CNFa3/33EAwTiAYBxAMA4gGAcQjAMIxgEEo/47muL65Q1QXL+8AYrrlzdAcf3yBiiuX94AxfXLG6C4fnkDzK5f7bw/q9wnqHDen6r3Caqd96fafYLKJ56Z/T5B1fP+VLlP4KcfsfcJKp/3p8J9gsrn/alwn+Dch9w77N0fB3AaBxCMAwgmXQDqryxm85tOUGfS+U0nqDPp/KYT1Jl0fqd+wPaCv1GtL4UAKo8uPhQCWCZoFDvVi0IAs6Lj6+8j4+V0AVT9Fswb9qd7AMM6bp2gaWxU6xMrxpQB/IawFH8dHcYn/9R+N20Af/8nLMblhMJuYTdqnV+4UkwfQHXoAGJxAME4gGAcQDAOIBgHEIwDqB5A5fk+A/YHk6k832fA/mAyFSebDNwfTKbqfJ9B+4Or8LcAzfYHV1Ftvs/A/cFNIajP95lgf3AzavN9JtsfGGOMMcYYY4wxxhjcJz9cFcM0z0soGwAAAABJRU5ErkJggg=="/>
                            </defs>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 제작 아이콘 --%>
                        <svg width="25"
                                height="25"
                                viewBox="0 0 25 25"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect width="25" height="25" fill="url(#pattern0_240_5985)" />
                            <defs>
                                <pattern id="pattern0_240_5985"
                                        patternContentUnits="objectBoundingBox"
                                        width="1"
                                        height="1">
                                    <use xlink:href="#image0_240_5985" transform="scale(0.0104167)" />
                                </pattern>
                                <image id="image0_240_5985"
                                        width="96"
                                        height="96"
                                        preserveAspectRatio="none"
                                        xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAA2UlEQVR4nO3VwQ3CMAAEQfff9FICL+SQm5FcAF5fOAcAAAAAnqsvBwHeLQsQYFoWIMC0LECAaVmAANOyAAGmZQECTMsCBJiWBQgwLQsQYFoWIMC0LECAaVmAANOyAAGmZQECTMsCBHj0C1w/P3f7B/bwI8AR4PorzALuX0Q+QfcvowvHf8AR4Por7M0LuK31C7gtAQSYlgUIMC0LEGBaFiDAtCxAgGlZgADTsgABpmUBAkzLAgSYlgUIMC0LEGBaFiDAtCxAgGlZgADTsgABpmUBAAAAAJw/9AFTazv9feL+wwAAAABJRU5ErkJggg=="/>
                            </defs>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 구매 아이콘 --%>
                        <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M18.1807 13.75C19.1179 13.75 19.9426 13.2375 20.3674 12.4625L24.8408 4.35C25.3031 3.525 24.7033 2.5 23.7537 2.5H5.26055L4.08598 0H0V2.5H2.49907L6.9974 11.9875L5.31053 15.0375C4.39837 16.7125 5.59792 18.75 7.49722 18.75H22.4916V16.25H7.49722L8.87171 13.75H18.1807ZM6.44761 5H21.6295L18.1807 11.25H9.40901L6.44761 5ZM7.49722 20C6.12273 20 5.01064 21.125 5.01064 22.5C5.01064 23.875 6.12273 25 7.49722 25C8.87171 25 9.99629 23.875 9.99629 22.5C9.99629 21.125 8.87171 20 7.49722 20ZM19.9926 20C18.6181 20 17.506 21.125 17.506 22.5C17.506 23.875 18.6181 25 19.9926 25C21.3671 25 22.4916 23.875 22.4916 22.5C22.4916 21.125 21.3671 20 19.9926 20Z"
                                    fill="black"/>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 판매 아이콘 --%>
                        <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M3.81944 0C3.57682 0.000129717 3.33847 0.0638077 3.1281 0.184694C2.91774 0.305581 2.74271 0.479459 2.62044 0.689019L0.189887 4.85569C0.0657367 5.06805 0.00020778 5.30957 0 5.55556V22.2222C0 23.7404 1.25963 25 2.77778 25H22.2222C23.7404 25 25 23.7404 25 22.2222V5.55556C24.9998 5.30957 24.9343 5.06805 24.8101 4.85569L22.3796 0.689019C22.2573 0.479459 22.0823 0.305581 21.8719 0.184694C21.6615 0.0638077 21.4232 0.000129765 21.1806 0H3.81944ZM4.61697 2.77778H20.383L22.0025 5.55556H2.9975L4.61697 2.77778ZM2.77778 8.33333H22.2222V22.2222H2.77778V8.33333ZM8.33333 11.1111V13.8889H16.6667V11.1111H8.33333Z"
                                    fill="black"/>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 매출 아이콘 --%>
                        <svg width="20" height="25" viewBox="0 0 20 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M7.91444 25V22.0139C6.02496 21.7361 4.3943 21.2037 3.02246 20.4167C1.6492 19.6296 0.641711 18.5185 0 17.0833L3.95722 16.0417C4.49198 17.1528 5.28556 17.9977 6.33797 18.5764C7.38895 19.1551 8.77005 19.4444 10.4813 19.4444C11.943 19.4444 13.1822 19.2306 14.1989 18.8028C15.2143 18.3741 15.7219 17.7083 15.7219 16.8056C15.7219 15.9954 15.3298 15.3528 14.5455 14.8778C13.7611 14.4037 11.943 13.8657 9.09091 13.2639C6.02496 12.6389 3.92157 11.8926 2.78075 11.025C1.63993 10.1565 1.06952 9.09722 1.06952 7.84722C1.06952 6.34259 1.81818 5.17361 3.31551 4.34028C4.81283 3.50694 6.34581 3.03241 7.91444 2.91667V0H12.1925V2.91667C13.975 3.10185 15.446 3.52407 16.6054 4.18333C17.7633 4.84352 18.6096 5.64815 19.1444 6.59722L15.1872 7.70833C14.7594 6.96759 14.1533 6.41204 13.369 6.04167C12.5847 5.6713 11.5152 5.48611 10.1604 5.48611C8.5918 5.48611 7.3975 5.71204 6.57754 6.16389C5.75758 6.61481 5.34759 7.17593 5.34759 7.84722C5.34759 8.61111 5.88235 9.21296 6.95187 9.65278C8.02139 10.0926 9.87522 10.5556 12.5134 11.0417C14.9733 11.5046 16.8364 12.2394 18.1027 13.2458C19.3676 14.2532 20 15.4167 20 16.7361C20 18.3796 19.2513 19.6296 17.754 20.4861C16.2567 21.3426 14.4029 21.875 12.1925 22.0833V25H7.91444Z"
                                    fill="black"/>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 거래 아이콘 --%>
                        <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path d="M12.7522 22.3237C12.5477 22.5488 12.1841 22.5863 11.9456 22.3237C11.741 22.0986 11.707 21.6983 11.9456 21.4357L15.7971 17.1961L14.1951 15.4327L10.3436 19.6723C10.1277 19.9225 9.76413 19.91 9.5369 19.6723C9.29831 19.4097 9.33239 19.0095 9.5369 18.7844L13.3885 14.5448L11.7865 12.7814L7.93492 17.021C7.73041 17.2461 7.36684 17.2836 7.12825 17.021C6.91238 16.7834 6.91238 16.3832 7.12825 16.1331L10.9798 11.8934L9.36648 10.1301L5.5149 14.3697C5.3104 14.5948 4.94683 14.6323 4.70823 14.3697C4.49236 14.1196 4.49236 13.7319 4.70823 13.4817L9.6846 8.004L11.8092 10.3302C12.8886 11.5183 14.7519 11.5058 15.8312 10.3302C16.9446 9.10455 16.9446 7.12856 15.8312 5.90295L13.718 3.57679L14.0361 3.22661C14.9223 2.25113 16.3652 2.25113 17.2514 3.22661L22.0687 8.52926C22.9549 9.50475 22.9549 11.093 22.0687 12.0685L12.7522 22.3237ZM23.6707 13.8444C25.4431 11.8934 25.4431 8.72936 23.6707 6.76588L18.8534 1.46323C17.081 -0.487744 14.2065 -0.487744 12.4227 1.46323L12.1046 1.81341L11.7865 1.46323C10.0141 -0.487744 7.13961 -0.487744 5.35584 1.46323L1.33385 5.89045C-0.279497 7.66633 -0.427197 10.4302 0.879384 12.3812L2.52681 10.5678C2.08371 9.62982 2.23141 8.44172 2.94719 7.65383L6.96919 3.22661C7.85539 2.25113 9.29831 2.25113 10.1845 3.22661L14.2292 7.67884C14.4337 7.90395 14.4678 8.30415 14.2292 8.56678C13.9906 8.82942 13.6271 8.7919 13.4226 8.56678L9.6846 4.46473L3.09489 11.7059C1.98146 12.919 1.98146 14.9075 3.09489 16.1331C3.53799 16.6208 4.10607 16.921 4.70823 17.0085C4.78776 17.6588 5.04908 18.2841 5.50354 18.7844C5.95801 19.2846 6.52609 19.5723 7.11689 19.6598C7.19642 20.3102 7.45773 20.9355 7.9122 21.4357C8.36666 21.936 8.93474 22.2236 9.52554 22.3112C9.60507 22.9865 9.87775 23.5993 10.3208 24.087C10.8548 24.6748 11.5706 25 12.3318 25C13.0931 25 13.8089 24.6748 14.3428 24.087L23.6707 13.8444Z"
                                    fill="black"/>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 인사 아이콘 --%>
                        <svg width="25"
                                height="25"
                                viewBox="0 0 25 25"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect width="25" height="25" fill="url(#pattern0_240_5982)" />
                            <defs>
                                <pattern id="pattern0_240_5982"
                                        patternContentUnits="objectBoundingBox"
                                        width="1"
                                        height="1">
                                    <use xlink:href="#image0_240_5982" transform="scale(0.0104167)" />
                                </pattern>
                                <image id="image0_240_5982"
                                        width="96"
                                        height="96"
                                        preserveAspectRatio="none"
                                        xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACsUlEQVR4nO2dS2oUURSGv1EcGUF8xS0k7sQgErIEwQXoMgxR1OBMXINDdRNRCA7jTAQfiSKScKXgNoikbUmn66vb/X9wJk0e/39O1Tnn9qAKQgghhDa4DtwHXgL7wPca+/Wze8CKLXIeWQFeAL+AMiG6n3kOXLNFzwu3gC//kfi/4zOwbotvnbvA8SmSP4rud+/YJlplHTiaIvmj6P7GTdtMa1wCPp5B8kfxCbhim2qJZ2eY/FHs2KZa4TLwYwYF+AlcZQ65ATwE3gKHM0hcOSG6vX8DOF/jNrDX0/8+rF63gTUz8eeAp1NuKeWUyb94gp7usw89a+m8PwGWjOS/6dlsqdFd+ePYlDS97rsIO5LRUlvOOJZFXY/77PnHAy3ABVFXd95Y7aMA26LJUgfuODZkbVt9FOCdbHLvH0P4vaxtt48CfJNNlrrtbNaev1yvfDv5peZm5kwSMe8U278uQEb3rwuQ0f3rAmR0/7oAGd2/LkBG968LkNH96wJkdP/TCigDj0mkAKQAuQNICyItKDOADGEyhLMFkTWUrKE5iNHMQax1iu1fFyCj+9cFyOj+dQEyun9dgIzuXxcgo/vXBcjo/qcVUOSYlhSAFCB3AGlBpAVlBpAhTIZwtiCyhpI1NAcxmjmItU6x/esCZHT/ugAZ3b8uQEb3rwuQ0f3rAmR0/7oAGd3/tALKwGMSKQApQO4A0oJIC8oMIEOYDOFsQWQNJWtoDmI0cxBrnWL71wXI6P51ATK6f12AjO5fFyCj+9cFyOj+dQEyuv+DGX8dXBqOr4vw6OIy4NhdhId3lwHHgz4KsHZGr5cqcxa9Pb6e+toO23AZWDyiR5bqazts02Ug8cp4j8xSfW3HIrejo3rl9578P1mtb47YXZAV9aB63eqz54cQQgghhBBCCCEEmuc3e7uN+TUc9UcAAAAASUVORK5CYII="/>
                            </defs>
                        </svg>
                    </c:when>
                    <c:when test="">
                        <%-- 게시판 아이콘 --%>
                        <svg width="25"
                                height="25"
                                viewBox="0 0 25 25"
                                fill="none"
                                xmlns="http://www.w3.org/2000/svg"
                                xmlns:xlink="http://www.w3.org/1999/xlink">
                            <rect width="25" height="25" fill="url(#pattern0_240_5988)" />
                            <defs>
                                <pattern id="pattern0_240_5988"
                                        patternContentUnits="objectBoundingBox"
                                        width="1"
                                        height="1">
                                    <use xlink:href="#image0_240_5988" transform="scale(0.0104167)" />
                                </pattern>
                                <image id="image0_240_5988"
                                        width="96"
                                        height="96"
                                        preserveAspectRatio="none"
                                        xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACwUlEQVR4nO2dPW4UQRCFn8TKl7FDJEuIgEP4IkRONyQyBss3ILB8BrgE4GOAkNchqNBI4wSt6B2Pu7/q6npSxfve+7Z7flY7I6VSqVQqVU9WGFre/YUPaM79hQ9ozv2FD2jO/YUPaM79hQ9ozv2FD2jO/YUPaM79FXUi6VLSd0kPBwTqfR7mrJdzdkxHkq4l/XFQikHzW9LV3EXz8r84KMCczOfWEK4dhDZn87FV+Sfz0qMDm7OZOjluAeCDg7DmdC5aALhzENSczrcWAHYOgprTuW8BoGQiuozOjxuAhefHDcDC8+MGYOH5cQOw8Py4AVh4ftwALDw/bgAWnr9kYPSpLjqgOZ8EoASAfwstVwBfhOUWxJdhwOQxQAkA/xbayCsguozOjxuAhefHDcDC8+MGYOH5cQOw8Py4AVh4ftwALDw/bgAWnn+tAXM+JSUAJYBcAcotSLkF5TFAeRBWHoTzLEh5Gqo8Dc0LMXVzIda7jM6PG4CF58cNwMLz4wZglf6kWF2jA3g1/xsyATiFUF2jr4AShOqqfT/dVs7az3+3EkJ1RQdgKyFU1wgAbAWE6hoFgD0RQnWNBMAkbRd081oNNBoAW7gSqmtEAOYJwqgAzAuEtQXQOu8dQu8AuocQAUDXEKIA6BZCJABdQogGoDsIEQF0BSEqgG4g/O/nOK/P+38TCUKPjy7eLbxRtl35eUtu4C3WeweF2sgr4bjjx9fvoqyEKwdlWicQzmoAOJpf20GXac4h3Eja1ADwCGF6bUduR2pf/r/HhIv55QW9vVtgV2kl7Ct/U2s7Gk3nhfJv95T/QtInL78nRIZwWyj/cRJCBQiHlp8QnlHbwp5/U9iu3j6nmVF19sTyp/kBeQ6tzYHlT/OVNjty+b8kvaQNR9yODi3/lDY76nVClg9CyPJBCFm+2ms6z/85n+3sPeD+BSUkkzIaUnjdAAAAAElFTkSuQmCC"/>
                            </defs>
                        </svg>
                    </c:when>
                </c:choose>
                ${selectIcon}

                <div class="home-labels">
                    <span class="home-sub">${seletTitle}</span>
                    <span class="home-main">${seletTitle}</span>
                </div>
            </div>

            <!-- 오른쪽: 사람 아이콘 + 로그아웃 아이콘 + 텍스트 -->
            <div class="header-right">
                <!-- 사람 아이콘 -->
                <svg width="40" height="40" viewBox="0 0 40 40" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <g clip-path="url(#clip0_57_3647)">
                        <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M32.5322 32.3193C30.8388 26.9643 26.2888 23.896 20.0438 23.896H19.9988C13.7372 23.861 9.16384 26.951 7.46717 32.3193L7.27051 32.9427L7.82717 33.2827C11.0905 35.2727 15.1605 36.281 19.9205 36.281C19.9738 36.281 20.0272 36.281 20.0788 36.281C24.9055 36.281 28.8622 35.2993 32.1722 33.2827L32.7288 32.9427L32.5322 32.3193Z"
                            fill="#7AC38F"
                        />
                        <path
                            fill-rule="evenodd"
                            clip-rule="evenodd"
                            d="M19.9997 20.1824C24.538 20.1824 28.2314 16.4907 28.2314 11.9524C28.2314 7.41237 24.538 3.7207 19.9997 3.7207C15.4614 3.7207 11.7697 7.41237 11.7697 11.9524C11.7697 16.4907 15.4614 20.1824 19.9997 20.1824Z"
                            fill="#7AC38F"
                        />
                    </g>
                    <defs>
                        <clipPath id="clip0_57_3647">
                            <rect width="40" height="40" fill="white" />
                        </clipPath>
                    </defs>
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
                <span class="welcome-text">디아멜로 님 어서오세요!</span>
            </div>
        </div>

        <script>
            function logout() {
                const checkLogout = confirm('정말 로그아웃 하시겠습니까?');

                if (checkLogout) {
                    location.href = 'logout.me';
                }
            }
        </script>
    </body>
</html>
