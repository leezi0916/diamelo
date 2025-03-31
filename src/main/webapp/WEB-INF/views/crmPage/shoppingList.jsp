<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 28.
  Time: 오전 10:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/crm/shoppingList.css">
    <link rel="stylesheet" href="/resources/css/default.css">



    <title>Title</title>
</head>
<body>
<jsp:include page="../common/crm/header.jsp"/>

<div id="list">
    <div id="list_header">
        <div><span>결제 페이지</span></div>
    </div>

    <div id="list_content">
        <table>
            <tr id="table_header" class="table_header">
                <td ><span>구매 기업 : 올리브영</span></td>
                <td><span>상품명</span></td>
                <td><span>총 구매 금액 : 2,900,000원</span></td>
                <td><span>총 물품 개수 : 290개</span></td>
                <td></td>
            </tr>
            <tr class="table_header">
                <td class="list_img"><img src="/resources/image/productImgae/product1.png" alt="상품1"></td>
                <td><span>독도앰플</span></td>
                <td><span>2,900,000 원(개당)</span></td>
                <td><span>290 개</span></td>
                <td>
                    <button>
                        <img src="/resources/image/delete_icon.png">
                    </button>
                </td>
            </tr>

            <tr class="table_header">
                <td class="list_img"><img src="/resources/image/productImgae/product1.png" alt="상품1"></td>
                <td><span>독도앰플</span></td>
                <td><span>2,900,000 원(개당)</span></td>
                <td><span>290 개</span></td>
                <td>
                    <button>
                        <img src="/resources/image/delete_icon.png">
                    </button>
                </td>
            </tr>

            <tr class="table_header">
                <td class="list_img"><img src="/resources/image/productImgae/product1.png" alt="상품1"></td>
                <td><span>독도앰플</span></td>
                <td><span>2,900,000 원(개당)</span></td>
                <td><span>290 개</span></td>
                <td>
                    <button>
                        <img src="/resources/image/delete_icon.png">
                    </button>
                </td>
            </tr>

        </table>
    </div>

    <div id="buy_button"><input type="button" value="구매 확정"></div>

</div>


<jsp:include page="../common/crm/footer.jsp"/>
</body>
</html>
