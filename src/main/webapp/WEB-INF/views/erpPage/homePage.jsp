<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Diamelo</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



        <style>
            .page-body-wrap{
                padding: 20px 20px 0px 20px;
            }

           #page-body-header{
               border-radius: 15px;
               width: 100%;
               height: 180px;
               background-color: #ffffff;
               box-shadow: 0px 4px 4px 0 rgba(0, 0, 0, 0.25);
               display: flex;
               align-items: center;

           }
           #page-body-content{
               border-radius: 15px;
               width: 100%;
               height: 500px;
               background-color: #ffffff;
               box-shadow: 0px 4px 4px 0 rgba(0, 0, 0, 0.25);

           }
           .header{
               width: 100%;
               height: 100%;
               padding: 1%;
           }

           #sales-container{
               width: 100%;
               height: 100%;
           }
        </style>
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
                    <div class="page-body-wrap">
                        <div id="page-body-header">
                            <div class="header">
                                <div id="sales-container">
                                    <div id="sales-title">
                                        s
                                    </div>
                                    <div id="sales-title">
                                        s
                                    </div>
                                </div>
                            </div>
                            <div class="header">
                                s
                            </div>
                            <div class="header">
                                s
                            </div>
                            <div class="header">
                                s
                            </div>
                        </div>
                    </div>

                    <div class="page-body-wrap">
                        <div id="page-body-content">

                        </div>
                    </div>










                </div>
            </div>
        </div>
    </body>
</html>
