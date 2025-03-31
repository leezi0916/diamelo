<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Diamelo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/boardDetailViewStyle.css" />
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
          게시글 보기
        </div>
      </div>

      <div id="page-body-content">
        <form>
        <div id="header">
          <div id="category">
            <div id="category0">공지사항</div>
          </div>
          <div id="title">
            <div id="title0">제목</div>
            <div id="title1"><input type="text" readonly value="3월 월급입니다. 확인해주세요."></div>
          </div>
          <div id="userId">
            <div id="userId0">작성자</div>
            <div><input type="text" readonly placeholder="admin"></div>
          </div>


        </div>


        <div id="content">
          <div id="content-name">내용</div>
          <div id="content-input">
            <textarea placeholder="3월 월급 ~~~~~~~~~" readonly></textarea>
          </div>
        </div>

        <div id="reply">
          <div id="reply1">
            <div id="reply-name">댓글 달기</div>
            <div id="replyBtn"> <button id="addBtn" type="submit">댓글 작성</button></div>
          </div>
          <div id="reply2">
            <div id="reply-input">
            <textarea>댓글 쓰기</textarea>
          </div>
          </div>

        </div>

        </form>
      </div>

      <div id="reply-content">

        <div class="reply-content1">
          <div class="reply-userId">
            <div>엄사원</div>
            <div>2025/03/01</div>
          </div>
          <textarea readonly></textarea>
          <button><img src="/resources/image/delete_icon.png" alt="삭제" width="20"></button>
        </div>
        <div class="reply-content1">

          <div class="reply-userId">
            <div>엄사원</div>
            <div>2025/03/01</div>
          </div>
          <textarea readonly></textarea>
          <button><img src="/resources/image/delete_icon.png" alt="삭제" width="20"></button>
        </div>
        <div class="reply-content1">

          <div class="reply-userId">
            <div>엄사원</div>
            <div>2025/03/01</div>
          </div>
          <textarea readonly></textarea>
          <button><img src="/resources/image/delete_icon.png" alt="삭제" width="20"></button>
        </div>
        <div class="reply-content1">

          <div class="reply-userId">
            <div>엄사원</div>
            <div>2025/03/01</div>
          </div>
          <textarea readonly></textarea>
          <button><img src="/resources/image/delete_icon.png" alt="삭제" width="20"></button>
        </div>
        <div class="reply-content1">

          <div class="reply-userId">
            <div>엄사원</div>
            <div>2025/03/01</div>
          </div>
          <textarea readonly></textarea>
          <button><img src="/resources/image/delete_icon.png" alt="삭제" width="20"></button>
        </div>
      </div>

      <div id="page-body-backBtn-div">
        <button id="backBtn" type="submit">뒤로 가기</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>
