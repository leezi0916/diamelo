<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/erp/homePageStyle.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap"
          rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="/js/erp/graph.js"></script>


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

            <div class="page-body-wrap">
                <div id="page-body-header">
                    <div class="header">
                        <div id="sales-container">
                            <div id="sales-title">
                                <p>
                                    <svg width="13" height="20" viewBox="0 0 13 20" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M4.94788 19.313V17.0881C3.81419 16.8811 2.8358 16.4844 2.0127 15.898C1.18874 15.3115 0.584246 14.4837 0.199219 13.4143L2.57355 12.6382C2.89441 13.466 3.37056 14.0956 4.002 14.5268C4.63259 14.958 5.46125 15.1736 6.48799 15.1736C7.365 15.1736 8.10853 15.0142 8.71858 14.6955C9.32778 14.376 9.63238 13.88 9.63238 13.2073C9.63238 12.6037 9.39708 12.1249 8.92649 11.7709C8.45591 11.4177 7.365 11.0169 5.65377 10.5684C3.81419 10.1028 2.55216 9.54669 1.86767 8.90025C1.18318 8.25312 0.84093 7.46387 0.84093 6.5325C0.84093 5.4114 1.29013 4.54039 2.18852 3.91948C3.08692 3.29856 4.00671 2.94499 4.94788 2.85875V0.685547H7.51473V2.85875C8.58425 2.99673 9.46681 3.31133 10.1624 3.80254C10.8572 4.29444 11.365 4.89397 11.6859 5.60112L9.31152 6.42901C9.05484 5.87709 8.6912 5.46314 8.22061 5.18718C7.75002 4.91122 7.10831 4.77324 6.29548 4.77324C5.3543 4.77324 4.63772 4.94157 4.14574 5.27825C3.65376 5.61423 3.40778 6.03231 3.40778 6.5325C3.40778 7.10167 3.72863 7.55011 4.37034 7.87781C5.01205 8.20552 6.12435 8.55047 7.70724 8.91267C9.18318 9.25762 10.301 9.80506 11.0608 10.555C11.8198 11.3056 12.1992 12.1725 12.1992 13.1556C12.1992 14.3802 11.75 15.3115 10.8516 15.9497C9.95323 16.5879 8.84093 16.9846 7.51473 17.1398V19.313H4.94788Z"
                                              fill="black"/>
                                    </svg>
                                     오늘 매출
                                </p>
                            </div>
                            <div id="sales-content">
                                <p>매출 : <fmt:formatNumber value="${todaySales}" type="number"/> 원</p>
                            </div>
                        </div>
                    </div>


                    <div class="header">
                        <div id="prosales-container">
                            <div id="prosales-title">
                                <p>
                                    <svg width="22" height="22" viewBox="0 0 22 22" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M3.36111 0C3.1476 0.000114151 2.93785 0.0561508 2.75273 0.162531C2.56761 0.268911 2.41359 0.421924 2.30599 0.606337L0.167101 4.273C0.0578483 4.45988 0.000182846 4.67242 0 4.88889V19.5556C0 20.8915 1.10848 22 2.44444 22H19.5556C20.8915 22 22 20.8915 22 19.5556V4.88889C21.9998 4.67242 21.9422 4.45988 21.8329 4.273L19.694 0.606337C19.5864 0.421924 19.4324 0.268911 19.2473 0.162531C19.0621 0.0561508 18.8524 0.000114193 18.6389 0H3.36111ZM4.06293 2.44444H17.9371L19.3622 4.88889H2.6378L4.06293 2.44444ZM2.44444 7.33333H19.5556V19.5556H2.44444V7.33333ZM7.33333 9.77778V12.2222H14.6667V9.77778H7.33333Z"
                                              fill="black"/>
                                    </svg>
                                    판매 현황
                                </p>
                            </div>
                            <div id="prosales-content">
                                <p>대기(${salesStatus1})</p>
                                <p>승인(${salesStatus2})</p>
                                <p>반려(${salesStatus3})</p>
                            </div>
                        </div>
                    </div>


                    <div class="header">
                        <div id="employee-container">
                            <div id="employee-title">
                                <p>
                                    <svg width="16" height="16" viewBox="0 0 16 16" fill="none"
                                         xmlns="http://www.w3.org/2000/svg">
                                        <path d="M8 8C10.21 8 12 6.21 12 4C12 1.79 10.21 0 8 0C5.79 0 4 1.79 4 4C4 6.21 5.79 8 8 8ZM8 10C5.33 10 0 11.34 0 14V16H16V14C16 11.34 10.67 10 8 10Z"
                                              fill="black"/>
                                    </svg>
                                    총 직원
                                </p>
                            </div>
                            <div id="employee-content">
                                <p>총 직원 : ${employeeCount} 명</p>
                            </div>
                        </div>
                    </div>
                    <div class="header">
                        <div id="prostock-container">
                            <div id="prostock-title">
                                <p>
                                    <svg width="25" height="25" viewBox="0 0 25 25" fill="none"
                                         xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                        <rect width="25" height="25" fill="url(#pattern0_192_5840)"/>
                                        <defs>
                                            <pattern id="pattern0_192_5840" patternContentUnits="objectBoundingBox"
                                                     width="1" height="1">
                                                <use xlink:href="#image0_192_5840" transform="scale(0.0104167)"/>
                                            </pattern>
                                            <image id="image0_192_5840" width="96" height="96"
                                                   preserveAspectRatio="none"
                                                   xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACIElEQVR4nO2bTU4CURCEa6FnEa8qIKdB76FcRGAlizKTjIkbfgbes7ua+pJeGqq6hpF0vwcYY4wxxhhjjDHGGNOOZwCvADYA9gCYvPYAPgEsAcyUH4RHACsAhwRN5ZV1GIN4gGDz3xM0kI3qTS2EVYKmsXEN3wSZd77ya4dHavD0BAEqPv0cawEBNgkaxU41/DpKzy5Bo9ipthDgnInsUFy/vAGK65c3QHH98gYorl/eAMX1yxuguH55AxTXL2+A4vqbG+CNFa3/33EAwTiAYBxAMA4gGAcQjAMIxgEEo/47muL65Q1QXL+8AYrrlzdAcf3yBiiuX94AxfXLG6C4fnkDzK5f7bw/q9wnqHDen6r3Caqd96fafYLKJ56Z/T5B1fP+VLlP4KcfsfcJKp/3p8J9gsrn/alwn+Dch9w77N0fB3AaBxCMAwgmXQDqryxm85tOUGfS+U0nqDPp/KYT1Jl0fqd+wPaCv1GtL4UAKo8uPhQCWCZoFDvVi0IAs6Lj6+8j4+V0AVT9Fswb9qd7AMM6bp2gaWxU6xMrxpQB/IawFH8dHcYn/9R+N20Af/8nLMblhMJuYTdqnV+4UkwfQHXoAGJxAME4gGAcQDAOIBgHEIwDqB5A5fk+A/YHk6k832fA/mAyFSebDNwfTKbqfJ9B+4Or8LcAzfYHV1Ftvs/A/cFNIajP95lgf3AzavN9JtsfGGOMMcYYY4wxxhjcJz9cFcM0z0soGwAAAABJRU5ErkJggg=="/>
                                        </defs>
                                    </svg>
                                    제품 재고현황
                                </p>
                            </div>
                            <div id="prostock-content">
                                <div id="prostock-content1">
                                    <div>
                                        제품명
                                    </div>
                                    <div>
                                        재고
                                    </div>
                                </div>
                                <div id="prostock-content2">
                                    <div style="color: red">
                                        ${product.proName}
                                    </div>
                                    <div style="color: red">
                                        ${product.proInventStock}
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-body-wrap1">
                    <div id="page-body-content">
                        <div id="week-sales">
                            <div id="week-sales1">
                                <p>월간 매출표</p>
                                <p style="color: #A9A9A9">최근 매출 : <fmt:formatNumber value="${recentSalesSum}" type="number"/> 원</p>
                            </div>
                            <div id="week-sales2">
                                <canvas id="monthlySalesChart" style="width: 100%; height: 100%;"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="page-body-wrap2">
                    <div id="page-body-content1">
                        <div id="myInfoPage">
                            <div id="myInfo">
                                <div id="myInfo-image">
                                    <c:choose>
                                        <c:when test="${not empty userInfo.changeName}">
                                            <img id="myPhoto" src="${userInfo.changeName}" alt="마이페이지 사진"/>
                                        </c:when>
                                        <c:otherwise>
                                            <img id="myPhoto" src="${pageContext.request.contextPath}/image/etc/myImg.png" alt="마이페이지 사진"/>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div id="myInfo-info">
                                <div id="myInfo-name">
                                    <div>이름</div>
                                    <input type="text" value="${loginUser.userName}" readonly>
                                </div>
                                <div id="myInfo-department">
                                    <div>부서</div>
                                    <input type="text" value="${userInfo.deptName}" readonly>
                                </div>
                                <div id="myInfo-job">
                                    <div>직급</div>
                                    <input type="text" value="${userInfo.jobName}" readonly>
                                </div>
                                <div id="myInfo-email">
                                    <div>이메일</div>
                                    <input type="text" value="${loginUser.email}" readonly>
                                </div>
                                <div id="myInfo-phone">
                                    <div>전화번호</div>
                                    <input type="text" value="${loginUser.phone}" readonly>
                                </div>
                            </div>

                        </div>
                        <div id="myInfoPage1">
                            <div class="myInfo-table">
                                <div class="myInfo-table-title">공지사항</div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>작성자</th>
                                        <th>제목</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list1}">
                                            <c:forEach var="item" items="${list1}">
                                                <tr>
                                                    <td>${item.userId}</td>
                                                    <td>${item.title}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr><td colspan="2"><h3>게시판이 없습니다.</h3></td></tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                            <div class="myInfo-table">
                                <div class="myInfo-table-title">문의사항</div>
                                <table class="table table-hover">
                                    <thead>
                                    <tr>
                                        <th>작성자</th>
                                        <th>제목</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:choose>
                                        <c:when test="${not empty list2}">
                                            <c:forEach var="item" items="${list2}">
                                                <tr>
                                                    <td>${item.userId}</td>
                                                    <td>${item.title}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:when>
                                        <c:otherwise>
                                            <tr><td colspan="2"><h3>게시판이 없습니다.</h3></td></tr>
                                        </c:otherwise>
                                    </c:choose>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        // 서버에서 받아온 데이터
        const monthlySales = <%= new com.fasterxml.jackson.databind.ObjectMapper().writeValueAsString(request.getAttribute("monthlySales")) %>;
    </script>


</body>
</html>
