<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 26.
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="../crmPage/crm_header.jsp"/>

<div id="list">
    <div id="list_header">
        <div><span>상품 리스트</span></div>
        <div>
            <div id="search">
                <div id="icon">
                    <svg width="26" height="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M11 19C15.4183 19 19 15.4183 19 11C19 6.58172 15.4183 3 11 3C6.58172 3 3 6.58172 3 11C3 15.4183 6.58172 19 11 19Z" stroke="#7AC38F" stroke-linecap="round" stroke-linejoin="round"/>
                        <path d="M21.0004 21.0004L16.6504 16.6504" stroke="#7AC38F" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                    </svg>
                </div>
                <div id="search_bar">
                    <input id="search_bar_input" type="search" placeholder="상품, 카테고리 검색">
                </div>
            </div>
        </div>
        <div></div>
    </div>
    <div id="list_content">

    </div>
    <div id="list_footer">

    </div>
</div>


<jsp:include page="../crmPage/crm_footer.jsp"/>
</body>
</html>
