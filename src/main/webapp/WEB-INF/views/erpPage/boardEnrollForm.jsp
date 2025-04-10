<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diamelo</title>
  <link rel="stylesheet" href="/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="/css/default.css" />
  <link rel="stylesheet" href="/css/erp/boardEnrollStyle.css" />
  <script src="/js/erp/boardEnrollForm.js"></script>
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
          게시글 작성
        </div>
      </div>

      <form action="insertBoard.bo" method="post" id="board-insert">
        <div id="page-body-content">
          <div id="header">
            <div id="userId">
              <div id="userId0"><p>*</p>작성자</div>
              <div><input type="text" readonly value="${loginUser.userId}" style="color:#757575" name="userId"></div>
            </div>

            <div id="category">
              <div id="category0"><p>*</p>게시글 분류</div>
              <div id="category1">
                <select id="selectOption" name="type">
                  <option selected disabled value="0">분류</option>
                  <option value="1">공지</option>
                  <option value="2">문의</option>
                </select>
              </div>
            </div>
          </div>
          <div id="header1">
            <div id="title">
              <div id="title0"><p>*</p>제목</div>
              <div id="title1"><input type="text"  placeholder="제목을 입력해주세요." name="title"></div>
            </div>
          </div>

          <div id="content">
            <div id="content-name">내용</div>
            <div id="content-input">
              <textarea placeholder="내용을 입력해주세요." name="content"></textarea>
            </div>
          </div>
        </div>

        <div id="footer">
          <div id="footer-wrap">
            <button id="addBtn" type="submit" onclick="return insertBoard()">게시글 등록</button>
            <button id="backBtn" type="button" onclick="location.href='board.erp'">뒤로가기</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</div>
</body>
</html>
