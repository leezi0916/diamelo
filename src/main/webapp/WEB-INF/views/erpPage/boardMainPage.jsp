<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/boardMainPageStyle.css" />
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
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
            <form>
                <div id="search-board">
                    <select id="search-category">
                        <option>전체</option>
                        <option>공지</option>
                        <option>문의</option>
                    </select>
                    <input  type="text" placeholder="제목" id="search-title">
                    <input type="text" placeholder="작성자" id="search-user">
                    <button id="searchBtn">
                        <svg width="20" height="20" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
                        </svg>
                        조회
                    </button>
                    <div id="add-btn-wrap">
                        <button id="addBtn">
                            <svg width="14" height="13" viewBox="0 0 14 13" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M7.15422 0.869141V12.0877M1.54492 6.47844H12.7635" stroke="white" stroke-width="1.60586" stroke-linecap="round" stroke-linejoin="round"/>
                            </svg>
                            게시글 작성
                        </button>
                    </div>
                </div>
                <table class="table table-hover">
                    <thead>
                    <tr>
                        <th> <input type="checkbox"></th>
                        <th>번호</th>
                        <th>분류</th>
                        <th>제목</th>
                        <th>작성자</th>
                        <th>작성일시</th>
                        <th>수정</th>
                        <th>삭제</th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td> <input type="checkbox"></td>
                        <td>5</td>
                        <td>공지</td>
                        <td>3월 월급입니다. 확인해주세요.</td>
                        <td>admin</td>
                        <td>2025/03/01</td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/update_icon.png" alt="수정" width="20">
                            </button>
                        </td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td> <input type="checkbox"></td>
                        <td>4</td>
                        <td>공지</td>
                        <td>2월 월급입니다. 확인해주세요.</td>
                        <td>admin</td>
                        <td>2025/02/01</td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/update_icon.png" alt="수정" width="20">
                            </button>
                        </td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td> <input type="checkbox"></td>
                        <td>3</td>
                        <td>공지</td>
                        <td>1월 월급입니다. 확인해주세요.</td>
                        <td>admin</td>
                        <td>2025/01/01</td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/update_icon.png" alt="수정" width="20">
                            </button>
                        </td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td> <input type="checkbox"></td>
                        <td>2</td>
                        <td>문의</td>
                        <td>월급 언제 주나요..</td>
                        <td>이지묵</td>
                        <td>2024/12/01</td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/update_icon.png" alt="수정" width="20">
                            </button>
                        </td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                            </button>
                        </td>
                    </tr>
                    <tr>
                        <td> <input type="checkbox"></td>
                        <td>1</td>
                        <td>문의</td>
                        <td>배고파요......</td>
                        <td>이지묵</td>
                        <td>2024/11/01</td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/update_icon.png" alt="수정" width="20">
                            </button>
                        </td>
                        <td>
                            <button class="icon-button">
                                <img src="/resources/image/delete_icon.png" alt="삭제" width="20">
                            </button>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </form>
            </div>

            <div id="page-body-page-div">
                <div>
                    <div class="page-body-page-div-start">
                        <p>이전</p>
                    </div>
                    <div>
                        <p>1</p>
                    </div>
                    <div>
                        <p>2</p>
                    </div>
                    <div>
                        <p>3</p>
                    </div>
                    <div>
                        <p>4</p>
                    </div>
                    <div>
                        <p>5</p>
                    </div>
                    <div>
                        <p>6</p>
                    </div>
                    <div>
                        <p>7</p>
                    </div>
                    <div>
                        <p>8</p>
                    </div>
                    <div>
                        <p>9</p>
                    </div>
                    <div>
                        <p>10</p>
                    </div>
                    <div class="page-body-page-div-end">
                        <p>다음</p>
                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
</body>
</html>
