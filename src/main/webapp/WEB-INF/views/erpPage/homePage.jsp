<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Diamelo</title>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>



        <style>
            .page-body-wrap{
                padding: 5%;
            }
            .page-body-wrap1{
                padding: 20px 0px;
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
               width: 25%;
               height: 100%;
               padding: 1%;
           }
            /*상단 1*/
           #sales-container{
               width: 100%;
               height: 100%;
           }
           #sales-title{
               width: 100%;
               height: 20%;
               font-size: 20px;
               font-weight: 500;
               text-align: center;
               display: flex;
               align-items: center;
               justify-content: center;
               border-bottom: 1px solid black;

           }
            #sales-content{
                width: 100%;
                height: 80%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            #sales-title > p{
                display: flex;
                align-items: center;
                gap: 10px;
            }
            #sales-content > p{
                display: flex;
                align-items: center;
                margin-top: 15px;
                gap: 10px;
            }
            /*상단 2*/
            #employee-container{
                width: 100%;
                height: 100%;
            }
            #employee-title{
                width: 100%;
                height: 20%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                border-bottom: 1px solid black;

            }
            #employee-content{
                width: 100%;
                height: 80%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            #employee-title > p{
                display: flex;
                align-items: center;
                gap: 10px;
            }
            #employee-content > p{
                display: flex;
                align-items: center;
                margin-top: 15px;
                gap: 10px;
            }
            /*상단 3*/
            #prosales-container{
                width: 100%;
                height: 100%;
            }
            #prosales-title{
                width: 100%;
                height: 20%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                border-bottom: 1px solid black;

            }
            #prosales-content{
                width: 100%;
                height: 80%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;

            }
            #prosales-title > p{
                display: flex;
                align-items: center;
                gap: 10px;
            }
            #prosales-content > p{
                display: flex;
                align-items: center;
                margin-top: 15px;
                gap: 10px;
                padding: 10px;
            }

            /*상단 4*/
            #prostock-container{
                width: 100%;
                height: 100%;
            }
            #prostock-title{
                width: 100%;
                height: 20%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                border-bottom: 1px solid black;

            }
            #prostock-content{
                width: 100%;
                height: 80%;
                font-size: 20px;
                font-weight: 500;
                text-align: center;
                margin-top: 10px;
            }

            #prostock-content1{
                display: flex;
                text-align: center;
                justify-content: space-around;
                padding: 10px;
                color: #A9A9A9;
            }
            #prostock-content2{
                display: flex;
                text-align: center;
                justify-content: space-around;
                padding: 10px;
            }



        /* 주간 매출표*/
            #week-sales{
                width: 100%;
                height: 100px;
                padding: 1%;

            }

            #week-sales1{
                width: 20%;
                text-align: center;
                font-size: 24px;
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
                                        <p><svg width="13" height="20" viewBox="0 0 13 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M4.94788 19.313V17.0881C3.81419 16.8811 2.8358 16.4844 2.0127 15.898C1.18874 15.3115 0.584246 14.4837 0.199219 13.4143L2.57355 12.6382C2.89441 13.466 3.37056 14.0956 4.002 14.5268C4.63259 14.958 5.46125 15.1736 6.48799 15.1736C7.365 15.1736 8.10853 15.0142 8.71858 14.6955C9.32778 14.376 9.63238 13.88 9.63238 13.2073C9.63238 12.6037 9.39708 12.1249 8.92649 11.7709C8.45591 11.4177 7.365 11.0169 5.65377 10.5684C3.81419 10.1028 2.55216 9.54669 1.86767 8.90025C1.18318 8.25312 0.84093 7.46387 0.84093 6.5325C0.84093 5.4114 1.29013 4.54039 2.18852 3.91948C3.08692 3.29856 4.00671 2.94499 4.94788 2.85875V0.685547H7.51473V2.85875C8.58425 2.99673 9.46681 3.31133 10.1624 3.80254C10.8572 4.29444 11.365 4.89397 11.6859 5.60112L9.31152 6.42901C9.05484 5.87709 8.6912 5.46314 8.22061 5.18718C7.75002 4.91122 7.10831 4.77324 6.29548 4.77324C5.3543 4.77324 4.63772 4.94157 4.14574 5.27825C3.65376 5.61423 3.40778 6.03231 3.40778 6.5325C3.40778 7.10167 3.72863 7.55011 4.37034 7.87781C5.01205 8.20552 6.12435 8.55047 7.70724 8.91267C9.18318 9.25762 10.301 9.80506 11.0608 10.555C11.8198 11.3056 12.1992 12.1725 12.1992 13.1556C12.1992 14.3802 11.75 15.3115 10.8516 15.9497C9.95323 16.5879 8.84093 16.9846 7.51473 17.1398V19.313H4.94788Z" fill="black"/>
                                        </svg>총 매출</p>
                                    </div>
                                    <div id="sales-content">
                                        <p>총 매출 : 200,000원 <svg width="49" height="22" viewBox="0 0 49 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="48.9246" height="21.8464" rx="10.9232" fill="#ECFDF3"/>
                                            <circle cx="9.61525" cy="10.9219" r="2.88478" fill="#14BA6D"/>
                                            <path d="M22.5944 5.88869H23.5983V6.90413C23.5983 7.58879 23.4829 8.23113 23.2522 8.83117C23.0291 9.42351 22.6983 9.94277 22.2598 10.389C21.829 10.8351 21.3059 11.1698 20.6905 11.3929L20.0443 10.4351C20.5982 10.2428 21.0636 9.96585 21.4405 9.60429C21.8251 9.24273 22.1136 8.83117 22.3059 8.3696C22.4983 7.90034 22.5944 7.41185 22.5944 6.90413V5.88869ZM22.8367 5.88869H23.8176V7.00798C23.8176 7.34647 23.8714 7.67725 23.9791 8.00035C24.0868 8.31575 24.2445 8.61577 24.4522 8.9004C24.6676 9.17734 24.9292 9.42351 25.2369 9.63891C25.5446 9.8543 25.8946 10.0274 26.2869 10.1582L25.6523 11.1044C25.0599 10.889 24.5522 10.5774 24.1291 10.1697C23.7137 9.76199 23.3945 9.28889 23.1714 8.75039C22.9483 8.20421 22.8367 7.62341 22.8367 7.00798V5.88869ZM27.1755 5.33481H28.3755V11.6583H27.1755V5.33481ZM28.0524 7.93112H29.8641V8.93502H28.0524V7.93112ZM24.983 11.9237C25.7138 11.9237 26.3369 12.0006 26.8524 12.1544C27.3755 12.3083 27.7793 12.5352 28.064 12.8352C28.3486 13.1276 28.4909 13.4814 28.4909 13.8968C28.4909 14.3046 28.3486 14.6546 28.064 14.9469C27.7793 15.2469 27.3755 15.4739 26.8524 15.6277C26.3369 15.7816 25.7138 15.8585 24.983 15.8585C24.2599 15.8585 23.6329 15.7816 23.1021 15.6277C22.579 15.4739 22.1752 15.2469 21.8905 14.9469C21.6136 14.6546 21.4751 14.3046 21.4751 13.8968C21.4751 13.4814 21.6136 13.1276 21.8905 12.8352C22.1752 12.5352 22.579 12.3083 23.1021 12.1544C23.6329 12.0006 24.2599 11.9237 24.983 11.9237ZM24.983 12.8699C24.4984 12.8699 24.083 12.9083 23.7368 12.9853C23.3906 13.0622 23.1252 13.1776 22.9406 13.3314C22.756 13.4853 22.6637 13.6738 22.6637 13.8968C22.6637 14.1122 22.756 14.2969 22.9406 14.4507C23.1252 14.6046 23.3906 14.7238 23.7368 14.8084C24.083 14.8854 24.4984 14.9238 24.983 14.9238C25.4754 14.9238 25.8908 14.8854 26.2292 14.8084C26.5754 14.7238 26.8408 14.6046 27.0254 14.4507C27.2101 14.2969 27.3024 14.1122 27.3024 13.8968C27.3024 13.6738 27.2101 13.4853 27.0254 13.3314C26.8408 13.1776 26.5754 13.0622 26.2292 12.9853C25.8908 12.9083 25.4754 12.8699 24.983 12.8699ZM34.9058 5.5079H35.9443V5.91177C35.9443 6.28102 35.8751 6.63489 35.7366 6.97337C35.5981 7.30416 35.402 7.61187 35.1481 7.8965C34.9019 8.18113 34.6019 8.43499 34.248 8.65808C33.8942 8.88117 33.5057 9.06964 33.0826 9.2235C32.6595 9.37735 32.2056 9.4889 31.721 9.55813L31.2825 8.61192C31.6979 8.55807 32.0902 8.46961 32.4595 8.34652C32.8287 8.22344 33.1634 8.07728 33.4634 7.90804C33.7634 7.7311 34.0211 7.53878 34.2365 7.33108C34.4519 7.11568 34.6173 6.88875 34.7327 6.65027C34.8481 6.4118 34.9058 6.16563 34.9058 5.91177V5.5079ZM35.1019 5.5079H36.1405V5.91177C36.1405 6.15794 36.1982 6.40026 36.3135 6.63873C36.4366 6.87721 36.6059 7.10414 36.8213 7.31954C37.0367 7.52725 37.2944 7.71956 37.5944 7.8965C37.8944 8.07343 38.2252 8.22344 38.5868 8.34652C38.956 8.46961 39.3522 8.55807 39.7753 8.61192L39.3253 9.55813C38.8483 9.4889 38.3983 9.37735 37.9752 9.2235C37.5521 9.06964 37.1636 8.88117 36.8097 8.65808C36.4559 8.4273 36.152 8.16959 35.8981 7.88496C35.652 7.60033 35.4558 7.29262 35.3096 6.96183C35.1712 6.63104 35.1019 6.28102 35.1019 5.91177V5.5079ZM30.7632 10.2736H40.2945V11.2428H30.7632V10.2736ZM35.5058 12.0967C36.6443 12.0967 37.5328 12.2583 38.1713 12.5814C38.8175 12.9045 39.1406 13.3699 39.1406 13.9776C39.1406 14.5853 38.8175 15.0508 38.1713 15.3739C37.5328 15.7046 36.6443 15.87 35.5058 15.87C34.375 15.87 33.4865 15.7046 32.8403 15.3739C32.2018 15.0508 31.8825 14.5853 31.8825 13.9776C31.8825 13.3699 32.2018 12.9045 32.8403 12.5814C33.4865 12.2583 34.375 12.0967 35.5058 12.0967ZM35.5058 13.0199C34.9981 13.0199 34.5634 13.0583 34.2019 13.1353C33.8403 13.2045 33.5634 13.3122 33.3711 13.4584C33.1864 13.5968 33.0941 13.7699 33.0941 13.9776C33.0941 14.193 33.1864 14.3738 33.3711 14.52C33.5634 14.6661 33.8403 14.7777 34.2019 14.8546C34.5634 14.9238 34.9981 14.9584 35.5058 14.9584C36.0289 14.9584 36.4674 14.9238 36.8213 14.8546C37.1828 14.7777 37.4559 14.6661 37.6405 14.52C37.8252 14.3738 37.9175 14.193 37.9175 13.9776C37.9175 13.7699 37.8252 13.5968 37.6405 13.4584C37.4559 13.3122 37.1828 13.2045 36.8213 13.1353C36.4674 13.0583 36.0289 13.0199 35.5058 13.0199Z" fill="#037847"/>
                                        </svg>
                                        </p>
                                    </div>
                                </div>
                            </div>


                            <div class="header">
                                <div id="prosales-container">
                                    <div id="prosales-title">
                                        <p><svg width="22" height="22" viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M3.36111 0C3.1476 0.000114151 2.93785 0.0561508 2.75273 0.162531C2.56761 0.268911 2.41359 0.421924 2.30599 0.606337L0.167101 4.273C0.0578483 4.45988 0.000182846 4.67242 0 4.88889V19.5556C0 20.8915 1.10848 22 2.44444 22H19.5556C20.8915 22 22 20.8915 22 19.5556V4.88889C21.9998 4.67242 21.9422 4.45988 21.8329 4.273L19.694 0.606337C19.5864 0.421924 19.4324 0.268911 19.2473 0.162531C19.0621 0.0561508 18.8524 0.000114193 18.6389 0H3.36111ZM4.06293 2.44444H17.9371L19.3622 4.88889H2.6378L4.06293 2.44444ZM2.44444 7.33333H19.5556V19.5556H2.44444V7.33333ZM7.33333 9.77778V12.2222H14.6667V9.77778H7.33333Z" fill="black"/>
                                        </svg>판매 현황</p>
                                    </div>
                                    <div id="prosales-content">
                                        <p>대기(?)</p>
                                        <p>승인(?)</p>
                                        <p>반려(?)</p>
                                    </div>
                                </div>
                            </div>


                            <div class="header">
                                <div id="employee-container">
                                    <div id="employee-title">
                                        <p><svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <path d="M8 8C10.21 8 12 6.21 12 4C12 1.79 10.21 0 8 0C5.79 0 4 1.79 4 4C4 6.21 5.79 8 8 8ZM8 10C5.33 10 0 11.34 0 14V16H16V14C16 11.34 10.67 10 8 10Z" fill="black"/>
                                        </svg>총 직원</p>
                                    </div>
                                    <div id="employee-content">
                                        <p>총 직원 : ?명 <svg width="49" height="22" viewBox="0 0 49 22" fill="none" xmlns="http://www.w3.org/2000/svg">
                                            <rect width="48.9246" height="21.8464" rx="10.9232" fill="#ECFDF3"/>
                                            <circle cx="9.61525" cy="10.9219" r="2.88478" fill="#14BA6D"/>
                                            <path d="M22.5944 5.88869H23.5983V6.90413C23.5983 7.58879 23.4829 8.23113 23.2522 8.83117C23.0291 9.42351 22.6983 9.94277 22.2598 10.389C21.829 10.8351 21.3059 11.1698 20.6905 11.3929L20.0443 10.4351C20.5982 10.2428 21.0636 9.96585 21.4405 9.60429C21.8251 9.24273 22.1136 8.83117 22.3059 8.3696C22.4983 7.90034 22.5944 7.41185 22.5944 6.90413V5.88869ZM22.8367 5.88869H23.8176V7.00798C23.8176 7.34647 23.8714 7.67725 23.9791 8.00035C24.0868 8.31575 24.2445 8.61577 24.4522 8.9004C24.6676 9.17734 24.9292 9.42351 25.2369 9.63891C25.5446 9.8543 25.8946 10.0274 26.2869 10.1582L25.6523 11.1044C25.0599 10.889 24.5522 10.5774 24.1291 10.1697C23.7137 9.76199 23.3945 9.28889 23.1714 8.75039C22.9483 8.20421 22.8367 7.62341 22.8367 7.00798V5.88869ZM27.1755 5.33481H28.3755V11.6583H27.1755V5.33481ZM28.0524 7.93112H29.8641V8.93502H28.0524V7.93112ZM24.983 11.9237C25.7138 11.9237 26.3369 12.0006 26.8524 12.1544C27.3755 12.3083 27.7793 12.5352 28.064 12.8352C28.3486 13.1276 28.4909 13.4814 28.4909 13.8968C28.4909 14.3046 28.3486 14.6546 28.064 14.9469C27.7793 15.2469 27.3755 15.4739 26.8524 15.6277C26.3369 15.7816 25.7138 15.8585 24.983 15.8585C24.2599 15.8585 23.6329 15.7816 23.1021 15.6277C22.579 15.4739 22.1752 15.2469 21.8905 14.9469C21.6136 14.6546 21.4751 14.3046 21.4751 13.8968C21.4751 13.4814 21.6136 13.1276 21.8905 12.8352C22.1752 12.5352 22.579 12.3083 23.1021 12.1544C23.6329 12.0006 24.2599 11.9237 24.983 11.9237ZM24.983 12.8699C24.4984 12.8699 24.083 12.9083 23.7368 12.9853C23.3906 13.0622 23.1252 13.1776 22.9406 13.3314C22.756 13.4853 22.6637 13.6738 22.6637 13.8968C22.6637 14.1122 22.756 14.2969 22.9406 14.4507C23.1252 14.6046 23.3906 14.7238 23.7368 14.8084C24.083 14.8854 24.4984 14.9238 24.983 14.9238C25.4754 14.9238 25.8908 14.8854 26.2292 14.8084C26.5754 14.7238 26.8408 14.6046 27.0254 14.4507C27.2101 14.2969 27.3024 14.1122 27.3024 13.8968C27.3024 13.6738 27.2101 13.4853 27.0254 13.3314C26.8408 13.1776 26.5754 13.0622 26.2292 12.9853C25.8908 12.9083 25.4754 12.8699 24.983 12.8699ZM34.9058 5.5079H35.9443V5.91177C35.9443 6.28102 35.8751 6.63489 35.7366 6.97337C35.5981 7.30416 35.402 7.61187 35.1481 7.8965C34.9019 8.18113 34.6019 8.43499 34.248 8.65808C33.8942 8.88117 33.5057 9.06964 33.0826 9.2235C32.6595 9.37735 32.2056 9.4889 31.721 9.55813L31.2825 8.61192C31.6979 8.55807 32.0902 8.46961 32.4595 8.34652C32.8287 8.22344 33.1634 8.07728 33.4634 7.90804C33.7634 7.7311 34.0211 7.53878 34.2365 7.33108C34.4519 7.11568 34.6173 6.88875 34.7327 6.65027C34.8481 6.4118 34.9058 6.16563 34.9058 5.91177V5.5079ZM35.1019 5.5079H36.1405V5.91177C36.1405 6.15794 36.1982 6.40026 36.3135 6.63873C36.4366 6.87721 36.6059 7.10414 36.8213 7.31954C37.0367 7.52725 37.2944 7.71956 37.5944 7.8965C37.8944 8.07343 38.2252 8.22344 38.5868 8.34652C38.956 8.46961 39.3522 8.55807 39.7753 8.61192L39.3253 9.55813C38.8483 9.4889 38.3983 9.37735 37.9752 9.2235C37.5521 9.06964 37.1636 8.88117 36.8097 8.65808C36.4559 8.4273 36.152 8.16959 35.8981 7.88496C35.652 7.60033 35.4558 7.29262 35.3096 6.96183C35.1712 6.63104 35.1019 6.28102 35.1019 5.91177V5.5079ZM30.7632 10.2736H40.2945V11.2428H30.7632V10.2736ZM35.5058 12.0967C36.6443 12.0967 37.5328 12.2583 38.1713 12.5814C38.8175 12.9045 39.1406 13.3699 39.1406 13.9776C39.1406 14.5853 38.8175 15.0508 38.1713 15.3739C37.5328 15.7046 36.6443 15.87 35.5058 15.87C34.375 15.87 33.4865 15.7046 32.8403 15.3739C32.2018 15.0508 31.8825 14.5853 31.8825 13.9776C31.8825 13.3699 32.2018 12.9045 32.8403 12.5814C33.4865 12.2583 34.375 12.0967 35.5058 12.0967ZM35.5058 13.0199C34.9981 13.0199 34.5634 13.0583 34.2019 13.1353C33.8403 13.2045 33.5634 13.3122 33.3711 13.4584C33.1864 13.5968 33.0941 13.7699 33.0941 13.9776C33.0941 14.193 33.1864 14.3738 33.3711 14.52C33.5634 14.6661 33.8403 14.7777 34.2019 14.8546C34.5634 14.9238 34.9981 14.9584 35.5058 14.9584C36.0289 14.9584 36.4674 14.9238 36.8213 14.8546C37.1828 14.7777 37.4559 14.6661 37.6405 14.52C37.8252 14.3738 37.9175 14.193 37.9175 13.9776C37.9175 13.7699 37.8252 13.5968 37.6405 13.4584C37.4559 13.3122 37.1828 13.2045 36.8213 13.1353C36.4674 13.0583 36.0289 13.0199 35.5058 13.0199Z" fill="#037847"/>
                                        </svg>
                                        </p>
                                    </div>
                            </div>
                        </div>
                            <div class="header">
                                <div id="prostock-container">
                                    <div id="prostock-title"><p><svg width="25" height="25" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                        <rect width="25" height="25" fill="url(#pattern0_192_5840)"/>
                                        <defs>
                                            <pattern id="pattern0_192_5840" patternContentUnits="objectBoundingBox" width="1" height="1">
                                                <use xlink:href="#image0_192_5840" transform="scale(0.0104167)"/>
                                            </pattern>
                                            <image id="image0_192_5840" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAACIElEQVR4nO2bTU4CURCEa6FnEa8qIKdB76FcRGAlizKTjIkbfgbes7ua+pJeGqq6hpF0vwcYY4wxxhhjjDHGGNOOZwCvADYA9gCYvPYAPgEsAcyUH4RHACsAhwRN5ZV1GIN4gGDz3xM0kI3qTS2EVYKmsXEN3wSZd77ya4dHavD0BAEqPv0cawEBNgkaxU41/DpKzy5Bo9ipthDgnInsUFy/vAGK65c3QHH98gYorl/eAMX1yxuguH55AxTXL2+A4vqbG+CNFa3/33EAwTiAYBxAMA4gGAcQjAMIxgEEo/47muL65Q1QXL+8AYrrlzdAcf3yBiiuX94AxfXLG6C4fnkDzK5f7bw/q9wnqHDen6r3Caqd96fafYLKJ56Z/T5B1fP+VLlP4KcfsfcJKp/3p8J9gsrn/alwn+Dch9w77N0fB3AaBxCMAwgmXQDqryxm85tOUGfS+U0nqDPp/KYT1Jl0fqd+wPaCv1GtL4UAKo8uPhQCWCZoFDvVi0IAs6Lj6+8j4+V0AVT9Fswb9qd7AMM6bp2gaWxU6xMrxpQB/IawFH8dHcYn/9R+N20Af/8nLMblhMJuYTdqnV+4UkwfQHXoAGJxAME4gGAcQDAOIBgHEIwDqB5A5fk+A/YHk6k832fA/mAyFSebDNwfTKbqfJ9B+4Or8LcAzfYHV1Ftvs/A/cFNIajP95lgf3AzavN9JtsfGGOMMcYYY4wxxhjcJz9cFcM0z0soGwAAAABJRU5ErkJggg=="/>
                                        </defs>
                                    </svg>제품 재고현황</p>
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
                                            <div>
                                                A제품
                                            </div>
                                            <div>
                                                70
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
                                    <p>주간 매출표</p>
                                    <p style="color: #A9A9A9">주간 매출 300,000원</p>
                                </div>
                            </div>
                        </div>
                     </div>
                        <div class="page-body-wrap1">
                            <div id="page-body-content">
                                <div id="week-sales">
                                    <div id="week-sales1">
                                        <p>주간 매출표</p>
                                        <p style="color: #A9A9A9">주간 매출 300,000원</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                </div>
            </div>
        </div>
    </body>
</html>
