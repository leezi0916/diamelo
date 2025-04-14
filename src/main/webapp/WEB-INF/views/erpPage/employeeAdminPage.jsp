<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>Diamelo</title>
  <%-- 공통 레이아웃 및 기본 스타일 적용 --%>
  <link rel="stylesheet" href="/css/erp/erpLayout.css" />
  <link rel="stylesheet" href="/css/default.css" />
  <link rel="stylesheet" href="/css/erp/employeeadminPageStyle.css" />

</head>
<body  style="background: #f8f8f8">
<div class="layout-wrapper">
  <!-- 왼쪽 고정 사이드바 -->
  <jsp:include page="../common/erp/sidebar.jsp" />

  <!-- 오른쪽 상단바 + 콘텐츠 -->
  <div class="main-area">
    <jsp:include page="../common/erp/header.jsp" />

    <!-- 페이지 본문 -->
    <div class="page-body">
      <%-- 페이지 제목 영역 --%>
      <div class="page-body-header">
        <div id="page-body-header-text">
          전체
        </div>
      </div>
      <%-- 검색 필터 + 테이블 리스트 영역 --%>
      <div class="page-body-content">
        <%-- 검색 필터 영역 --%>
        <div id="page-body-content-search-button">
          <form action="empAdminSearch.erp" class="search-form">
            <input type="text" class="input-box" placeholder="사용자명ID" name="userId">
            <input type="text" class="input-box" placeholder="직원명" name="userName">
            <%-- 검색 버튼(아이콘 + 텍스트포함) --%>
            <button type="submit" class="input-box">
              <svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg">
                <path fill-rule="evenodd" clip-rule="evenodd" d="M4.14111 11.0614C4.14111 7.18044 7.29911 4.02344 11.1801 4.02344C15.0601 4.02344 18.2181 7.18044 18.2181 11.0614C18.2181 14.9424 15.0601 18.1004 11.1801 18.1004C7.29911 18.1004 4.14111 14.9424 4.14111 11.0614ZM22.6361 21.5204L18.0371 16.9334C19.3931 15.3524 20.2181 13.3034 20.2181 11.0614C20.2181 6.07844 16.1631 2.02344 11.1801 2.02344C6.19611 2.02344 2.14111 6.07844 2.14111 11.0614C2.14111 16.0454 6.19611 20.1004 11.1801 20.1004C13.2021 20.1004 15.0651 19.4244 16.5721 18.2974L21.2241 22.9364L22.6361 21.5204Z" fill="black"/>
              </svg>
              조회
            </button>
          </form>

        </div>
        <%-- 판매 내역 테이블 영역 --%>
        <div id="page-body-content-search-list">
          <table class="table table-hover" style="text-align: center">
            <thead>
            <tr>
              <th>번호
                <%-- 정렬 아이콘 --%>
                <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5.61683 1.01172V9.9866M5.61683 9.9866L10.1043 5.49916M5.61683 9.9866L1.12939 5.49916" stroke="black" stroke-width="1.28213" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
              </th>
              <th>사용자ID</th>
              <th>직원명</th>
              <th>연락처</th>
              <th>이메일</th>
              <th>상태
                <svg width="11" height="11" viewBox="0 0 11 11" fill="none" xmlns="http://www.w3.org/2000/svg">
                  <path d="M5.61683 1.01172V9.9866M5.61683 9.9866L10.1043 5.49916M5.61683 9.9866L1.12939 5.49916" stroke="black" stroke-width="1.28213" stroke-linecap="round" stroke-linejoin="round"/>
                </svg></th>
              <th>직급(권한)</th>
              <th>수정</th>
              <th>삭제</th>
            </tr>
            </thead>
            <tbody>
            <%-- 반복 가능한 판매 내역 행 --%>
            <c:forEach var="u" items="${list}">
              <tr>
                <td>${u.RNum}</td>
                <td>${u.userId}</td>
                <td>${u.userName}</td>
                <td>${u.phone}</td>
                <td>${u.email}</td>

                <c:choose>
                  <c:when test="${u.status == 'Y'}">
                    <td>
                      <svg width="49" height="23" viewBox="0 0 49 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="0.0782471" y="0.576172" width="48.9246" height="21.8464" rx="10.9232" fill="#ECFDF3"/>
                        <circle cx="9.69423" cy="11.4981" r="2.88478" fill="#14BA6D"/>
                        <path d="M24.3684 6.08407H25.4069V6.48794C25.4069 6.85719 25.3377 7.21106 25.1992 7.54954C25.0607 7.88033 24.8646 8.18804 24.6107 8.47267C24.3645 8.7573 24.0645 9.01116 23.7106 9.23425C23.3568 9.45734 22.9683 9.64582 22.5452 9.79967C22.1221 9.95352 21.6682 10.0651 21.1836 10.1343L20.7451 9.1881C21.1605 9.13425 21.5528 9.04578 21.9221 8.9227C22.2913 8.79961 22.626 8.65345 22.926 8.48421C23.226 8.30728 23.4837 8.11496 23.6991 7.90725C23.9145 7.69186 24.0799 7.46492 24.1953 7.22644C24.3107 6.98797 24.3684 6.7418 24.3684 6.48794V6.08407ZM24.5645 6.08407H25.6031V6.48794C25.6031 6.73411 25.6608 6.97643 25.7761 7.2149C25.8992 7.45338 26.0685 7.68032 26.2839 7.89571C26.4993 8.10342 26.757 8.29574 27.057 8.47267C27.357 8.6496 27.6878 8.79961 28.0494 8.9227C28.4186 9.04578 28.8148 9.13425 29.2379 9.1881L28.7879 10.1343C28.3109 10.0651 27.8609 9.95352 27.4378 9.79967C27.0147 9.64582 26.6262 9.45734 26.2723 9.23425C25.9185 9.00347 25.6146 8.74576 25.3607 8.46113C25.1146 8.1765 24.9184 7.86879 24.7722 7.538C24.6338 7.20721 24.5645 6.85719 24.5645 6.48794V6.08407ZM20.2258 10.8497H29.7571V11.819H20.2258V10.8497ZM24.9684 12.6729C26.1069 12.6729 26.9954 12.8345 27.6339 13.1576C28.2801 13.4807 28.6032 13.9461 28.6032 14.5538C28.6032 15.1615 28.2801 15.6269 27.6339 15.95C26.9954 16.2808 26.1069 16.4462 24.9684 16.4462C23.8376 16.4462 22.9491 16.2808 22.3029 15.95C21.6644 15.6269 21.3451 15.1615 21.3451 14.5538C21.3451 13.9461 21.6644 13.4807 22.3029 13.1576C22.9491 12.8345 23.8376 12.6729 24.9684 12.6729ZM24.9684 13.596C24.4607 13.596 24.026 13.6345 23.6645 13.7114C23.3029 13.7807 23.026 13.8884 22.8337 14.0345C22.649 14.173 22.5567 14.3461 22.5567 14.5538C22.5567 14.7692 22.649 14.95 22.8337 15.0961C23.026 15.2423 23.3029 15.3538 23.6645 15.4308C24.026 15.5 24.4607 15.5346 24.9684 15.5346C25.4915 15.5346 25.93 15.5 26.2839 15.4308C26.6454 15.3538 26.9185 15.2423 27.1031 15.0961C27.2878 14.95 27.3801 14.7692 27.3801 14.5538C27.3801 14.3461 27.2878 14.173 27.1031 14.0345C26.9185 13.8884 26.6454 13.7807 26.2839 13.7114C25.93 13.6345 25.4915 13.596 24.9684 13.596ZM38.3183 5.91098H39.5299V13.5614H38.3183V5.91098ZM32.6526 15.2577H39.8299V16.2385H32.6526V15.2577ZM32.6526 12.7883H33.8526V15.6385H32.6526V12.7883ZM33.8411 6.61487C34.3719 6.61487 34.8488 6.72641 35.2719 6.9495C35.695 7.17259 36.0297 7.48415 36.2758 7.88417C36.522 8.2765 36.6451 8.73038 36.6451 9.24579C36.6451 9.75351 36.522 10.2074 36.2758 10.6074C36.0297 11.0074 35.695 11.319 35.2719 11.5421C34.8488 11.7652 34.3719 11.8767 33.8411 11.8767C33.3103 11.8767 32.8333 11.7652 32.4102 11.5421C31.9871 11.319 31.6525 11.0074 31.4063 10.6074C31.1602 10.2074 31.0371 9.75351 31.0371 9.24579C31.0371 8.73038 31.1602 8.2765 31.4063 7.88417C31.6525 7.48415 31.9871 7.17259 32.4102 6.9495C32.8333 6.72641 33.3103 6.61487 33.8411 6.61487ZM33.8411 7.66493C33.5334 7.66493 33.2564 7.73032 33.0103 7.8611C32.7641 7.99187 32.5718 8.1765 32.4333 8.41497C32.2948 8.64576 32.2256 8.9227 32.2256 9.24579C32.2256 9.56889 32.2948 9.84967 32.4333 10.0881C32.5718 10.3189 32.7641 10.4997 33.0103 10.6305C33.2564 10.7613 33.5334 10.8267 33.8411 10.8267C34.1488 10.8267 34.4257 10.7613 34.6719 10.6305C34.9181 10.4997 35.1104 10.3189 35.2489 10.0881C35.395 9.84967 35.4681 9.56889 35.4681 9.24579C35.4681 8.9227 35.395 8.64576 35.2489 8.41497C35.1104 8.1765 34.9181 7.99187 34.6719 7.8611C34.4257 7.73032 34.1488 7.66493 33.8411 7.66493Z" fill="#037847"/>
                      </svg>
                    </td>
                  </c:when>
                  <c:when test="${u.status =='N'}">
                    <td>
                    <svg width="49" height="23" viewBox="0 0 49 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                      <rect x="0.078125" y="0.302734" width="48.9246" height="21.8464" rx="10.9232" fill="#F6C6C6"/>
                      <circle cx="9.69386" cy="11.2246" r="2.88478" fill="#BA2714"/>
                      <path d="M27.2531 5.63755H28.4532V13.3918H27.2531V5.63755ZM28.0954 8.73003H29.9417V9.73394H28.0954V8.73003ZM21.7835 14.9842H28.8916V15.9651H21.7835V14.9842ZM21.7835 12.6303H22.9952V15.2035H21.7835V12.6303ZM20.595 6.38759H21.7951V8.03768H24.3683V6.38759H25.5684V11.6725H20.595V6.38759ZM21.7951 8.97235V10.7032H24.3683V8.97235H21.7951ZM38.3759 5.62601H39.576V16.1958H38.3759V5.62601ZM36.4489 7.95691H38.6298V8.93774H36.4489V7.95691ZM31.2216 12.7803H32.0294C32.5679 12.7803 33.0756 12.7764 33.5526 12.7687C34.0372 12.7533 34.5218 12.7264 35.0065 12.688C35.4911 12.6418 35.995 12.5764 36.5181 12.4918L36.6104 13.4842C36.0796 13.5688 35.5642 13.6342 35.0642 13.6803C34.5718 13.7265 34.0795 13.7572 33.5872 13.7726C33.0948 13.788 32.5756 13.7957 32.0294 13.7957H31.2216V12.7803ZM31.1986 6.54914H35.8488V10.4609H32.4102V13.011H31.2216V9.49162H34.6603V7.52996H31.1986V6.54914ZM36.3912 10.8417H38.5721V11.811H36.3912V10.8417Z" fill="#850C03"/>
                    </svg>
                    </td>
                  </c:when>
                  <c:otherwise>
                    <td>
                      <svg width="49" height="23" viewBox="0 0 49 23" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <rect x="0.0782471" y="0.576172" width="48.9246" height="21.8464" rx="10.9232" fill="#F6F2C6"/>
                        <circle cx="9.69423" cy="11.4981" r="2.88478" fill="#B2BA14"/>
                        <path d="M28.0609 5.89944H29.2148V16.4462H28.0609V5.89944ZM26.4454 10.0535H28.3609V11.0459H26.4454V10.0535ZM25.6838 6.11869H26.8147V15.9269H25.6838V6.11869ZM20.572 12.9499H21.2759C21.7605 12.9499 22.2067 12.9422 22.6144 12.9268C23.0221 12.9114 23.4183 12.8845 23.803 12.846C24.1953 12.7998 24.5953 12.7383 25.003 12.6614L25.1184 13.6537C24.6953 13.7384 24.2837 13.8037 23.8837 13.8499C23.4837 13.8884 23.0721 13.9153 22.649 13.9307C22.2336 13.9461 21.7759 13.9538 21.2759 13.9538H20.572V12.9499ZM20.572 7.15721H24.4722V8.13804H21.7605V13.4114H20.572V7.15721ZM38.3414 5.89944H39.553V16.4462H38.3414V5.89944ZM35.2373 7.01874H36.4374C36.4374 7.8034 36.3528 8.55344 36.1835 9.26887C36.0143 9.9843 35.7374 10.6651 35.3527 11.3113C34.9758 11.9498 34.4757 12.5421 33.8526 13.0883C33.2372 13.6345 32.4756 14.1268 31.5679 14.5653L30.9217 13.6076C31.9448 13.1152 32.7718 12.5537 33.4026 11.9229C34.0334 11.2921 34.495 10.5882 34.7873 9.81121C35.0873 9.02655 35.2373 8.16496 35.2373 7.22644V7.01874ZM31.441 7.01874H35.7797V7.98803H31.441V7.01874Z" fill="#857A03"/>
                      </svg>
                    </td>
                  </c:otherwise>

                </c:choose>
                <td>${u.jobName}</td>
                <td>
                  <button class="icon-button"  onclick="location.href='empDetail.erp?uId=${u.userId}'">
                    <img src="/image/update_icon.png" alt="수정" width="20">
                  </button>
                </td>
                <td>
                  <button class="icon-button userDelete"
                          data-userid="${u.userId}"
                          data-status="${u.status}">
                    <img src="/image/delete_icon.png" alt="삭제" width="20">
                  </button>
                </td>
              </tr>
            </c:forEach>

            </tbody>
          </table>
        </div>
        <div id="page-body-content-button-div">
          <input type="button" class="submitBtn" value="인사 관리 페이지 돌아가기" onclick="location.href='empList.erp'">
        </div>
      </div>

      <c:choose>
        <c:when test="${not empty userId or not empty userName}">
          <c:url var="pageUrl" value="empAdminSearch.erp">
            <c:param name="userName" value="${userName}" />
            <c:param name="userId" value="${userId}" />
          </c:url>
        </c:when>
        <c:otherwise>
          <c:set var="pageUrl" value="empAdminList.erp?" />
        </c:otherwise>
      </c:choose>
      <%-- 페이지바 --%>
      <div id="pagingArea">
        <ul class="pagination">
          <c:choose>
            <c:when test="${ pi.currentPage eq 1 }">
              <li class="page-item disabled" ><a class="page-link" href="#">이전</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link" href="${pageUrl}&epage=${pi.currentPage - 1}">이전</a></li>
            </c:otherwise>
          </c:choose>

          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
            <li class="page-item"><a class="page-link" href="${pageUrl}&epage=${p}">${p}</a></li>
          </c:forEach>

          <c:choose>
            <c:when test="${ pi.currentPage eq pi.maxPage }">
              <li class="page-item disabled"><a class="page-link" href="#">다음</a></li>
            </c:when>
            <c:otherwise>
              <li class="page-item"><a class="page-link" href="${pageUrl}&epage=${pi.currentPage + 1}">다음</a></li>
            </c:otherwise>
          </c:choose>
        </ul>
      </div>

    </div>
  </div>
</div>
<!-- 회원 탈퇴 모달 -->
<div id="deleteModal" class="modal">
  <div class="modal-content">
    <div class="modal-header">
      <h3>회원 탈퇴</h3>
      <p id="modalText">아이디를 입력해주세요</p>
      <p>상태가 대기인 회원은 삭제</p>
      <p>상태가 승인인 회원은 상태변환(N)으로 변환됩니다.</p>
    </div>

    <input id="thPwd" placeholder="해당 아이디를 입력해주세요.">
    <label>
      <input type="checkbox" id="confirmCheck"> 동의합니다.
    </label>


    <div class="modal-footer">
      <button id="confirmDelete" class="modal-button btn-danger" type="submit">삭제하기 </button>
      <button id="cancelDelete" class="modal-button btn-cancel">취소</button>
    </div>

  </div>
</div>
<script src="/js/erp/employeeAdminPage.js"></script>
</body>
</html>
