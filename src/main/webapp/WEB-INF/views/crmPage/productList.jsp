<%--
  Created by IntelliJ IDEA.
  User: user1
  Date: 25. 3. 26.
  Time: 오전 9:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <link rel="stylesheet" href="/resources/css/crm/productList.css">
    <link rel="stylesheet" href="/resources/css/default.css">

    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <title>Document</title>

</head>
<body>
<jsp:include page="../common/crm/header.jsp"/>
<style>
    ul{
        margin: 0;
    }

    /* modal */

    .modal{

    }

    .modal-dialog{
        margin-top: 200px;
    }

    #sort{
        display: flex;
        justify-content: center;
    }

    #sort img{
        border-radius: 10px;
    }

    .modal-footer{
        display: flex;
        align-items: center;
        justify-content: center;
    }

    #modal-footer-title span{
        font-size: 28px;
        font-weight: 700;

    }

    #modal-footer-note{
        padding: 0 70px;
    }

    .modal-footer-font{
        font-size: 16px;
        font-weight: 500;
    }

    #modal-footer-both button{
        width: 100%;
    }

    #modal-footer-both div{
        padding: 10px;
    }

    #modal-footer-price{
        font-size: 24px;
        font-weight: 700;
        border-bottom: black;
    }

</style>
<div id="list">
    <div id="list_header">
        <div><span>상품 리스트</span></div>

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

        <div></div>
    </div>
    <div id="list_content">
        <div class="product_table1">
            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>
        </div>


        <div class="product_table1">
            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>

            <div class="product_table_inner" >
                <div data-toggle="modal" data-target="#myModal">
                    <div class="product_img" >
                        <img src="/resources/image/productImgae/product1.png" alt="상품">
                    </div>
                    <div class="product_name">
                        <span>독도앰플</span>
                        <span>15,600원</span>
                    </div>
                </div>

                <div class="product_number">
                    <div class="product_number_inner">
                        <div class="number_button1"><input type="button" value="-"></div>
                        <div class="number"><input type="text" value="1"></div>
                        <div class="number_button2"><input type="button" value="+"></div>
                    </div>
                </div>
            </div>
        </div>

<%--    paging bar    --%>
        <div id="pagingArea">
            <ul class="pagination">

                <c:choose>
                    <c:when test="${ pi.currentPage eq 1 }">
                        <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage - 1}">Previous</a></li>
                    </c:otherwise>
                </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item"><a class="page-link" href="list.bo?cpage=${p}">${p}</a></li>
                </c:forEach>

                <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.bo?cpage=${pi.currentPage + 1}">Next</a></li>
                    </c:otherwise>
                </c:choose>

            </ul>
        </div>

    </div>
    <div id="list_footer">
        <div id="content_footer">
            <div id="list_footer_header">
                <div id="list_go">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <g clip-path="url(#clip0_280_4433)">
                            <rect width="30" height="30" fill="url(#pattern0_280_4433)"/>
                        </g>
                        <defs>
                            <pattern id="pattern0_280_4433" patternContentUnits="objectBoundingBox" width="1" height="1">
                                <use xlink:href="#image0_280_4433" transform="scale(0.0104167)"/>
                            </pattern>
                            <clipPath id="clip0_280_4433">
                                <rect width="30" height="30" fill="white"/>
                            </clipPath>
                            <image id="image0_280_4433" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,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"/>
                        </defs>
                    </svg>
                </div>

                <div id="list_footer_title">
                    <span>장바구니 목록</span>
                </div>

                <div id="hidden_button">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M11.25 15H18.75M27.5 15C27.5 21.9036 21.9036 27.5 15 27.5C8.09644 27.5 2.5 21.9036 2.5 15C2.5 8.09644 8.09644 2.5 15 2.5C21.9036 2.5 27.5 8.09644 27.5 15Z" stroke="#666666" stroke-width="1.5" stroke-linecap="round"/>
                    </svg>
                </div>

            </div>

            <!-- 장바구니 목록에 li가 생성되면서 제품사진, 제품이름, 장바구니에담긴갯수를 작성 -->
            <div id="shopping_list">
                <div class="next_list_button">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                        <rect width="30" height="30" fill="url(#pattern0_280_4540)"/>
                        <defs>
                            <pattern id="pattern0_280_4540" patternContentUnits="objectBoundingBox" width="1" height="1">
                                <use xlink:href="#image0_280_4540" transform="scale(0.0104167)"/>
                            </pattern>
                            <image id="image0_280_4540" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,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"/>
                        </defs>
                    </svg>
                </div>
                <ul id="shopping_list_ul1">
                    <li>
                        <ul class="shopping_list_ul2">
                            <li class="shopping_list_both">
                                <img src="/resources/image/productImgae/product1.png" alt="">
                                <button>
                                    <svg width="24" height="24" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M8.64385 8.85616L12.3562 12.5685M8.64385 12.5685L12.3562 8.85615M19.25 10.5C19.25 15.3325 15.3325 19.25 10.5 19.25C5.66751 19.25 1.75 15.3325 1.75 10.5C1.75 5.66751 5.66751 1.75 10.5 1.75C15.3325 1.75 19.25 5.66751 19.25 10.5Z" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round"/>
                                    </svg>
                                </button>
                            </li>
                            <li><span>독도앰플</span></li>
                            <li>
                                <span>20개</span>
                            </li>
                        </ul>
                    </li>

                    <li>
                        <ul class="shopping_list_ul2">
                            <li class="shopping_list_both">
                                <img src="/resources/image/productImgae/product1.png" alt="">
                                <button>
                                    <svg width="24" height="24" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M8.64385 8.85616L12.3562 12.5685M8.64385 12.5685L12.3562 8.85615M19.25 10.5C19.25 15.3325 15.3325 19.25 10.5 19.25C5.66751 19.25 1.75 15.3325 1.75 10.5C1.75 5.66751 5.66751 1.75 10.5 1.75C15.3325 1.75 19.25 5.66751 19.25 10.5Z" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round"/>
                                    </svg>
                                </button>
                            </li>
                            <li><span>독도앰플</span></li>
                            <li><span>20개</span></li>
                        </ul>
                    </li>

                    <li>
                        <ul class="shopping_list_ul2">
                            <li class="shopping_list_both">
                                <img src="/resources/image/productImgae/product1.png" alt="">
                                <button>
                                    <svg width="24" height="24" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg">
                                        <path d="M8.64385 8.85616L12.3562 12.5685M8.64385 12.5685L12.3562 8.85615M19.25 10.5C19.25 15.3325 15.3325 19.25 10.5 19.25C5.66751 19.25 1.75 15.3325 1.75 10.5C1.75 5.66751 5.66751 1.75 10.5 1.75C15.3325 1.75 19.25 5.66751 19.25 10.5Z" stroke="#FF0000" stroke-width="1.5" stroke-linecap="round"/>
                                    </svg>
                                </button>
                            </li>
                            <li><span>독도앰플</span></li>
                            <li><span>20개</span></li>
                        </ul>
                    </li>
                </ul>

                <div class="next_list_button">
                    <svg width="30" height="30" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" >
                        <rect width="30" height="30" fill="url(#pattern0_280_4541)"/>
                        <defs>
                            <pattern id="pattern0_280_4541" patternContentUnits="objectBoundingBox" width="1" height="1">
                                <use xlink:href="#image0_280_4541" transform="scale(0.0104167)"/>
                            </pattern>
                            <image id="image0_280_4541" width="96" height="96" preserveAspectRatio="none" xlink:href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGAAAABgCAYAAADimHc4AAAACXBIWXMAAAsTAAALEwEAmpwYAAAIMElEQVR4nO1da6hVRRQeJc1+ZZqVPYgev3phL0h6P63s9aMfWVFRcoNSyvCxZ46wFSsy71nrXK9GUkEYBKYkFAQhdO+Zde4V0XyUBOYrKwofXS39oVaeWPuc+yPLM7PPfs25Z3+w4XBes2Zmz1pr1lrzbSFy5MiRI0eOHDly5MiRwyFI3TXOq8B9UsN0SbhUEq6RhN8owp2KYEBqPMYXv+b3+DP+jtK4hH9T+23XuKz70TKY0V88QxE8LDWgItiiNJxQhNVIF/+Hxs38n54uPeT3+KOy7qdz8KjreknQpTQciDzg5uuQIlxeILhHVKvDRLti+hddp0vCF6WGHSkM+ilWB25XBB0si2gnNSM1zJAaf85s4E+6WBZJ8ArLJoYyWAdLgl1ZD7g69bXTqxQfFEMNhXLnRYpgtQMDXLVcEZ/O7um6UAwFeBV8RGr8LetBVeGvQ1LD46JV4W/1RwbuZERXUmrcKwlWScJ5UhefUGW4rlBefIlH75zVsWHZCL74Nb8XfKZxiiKYz79RBPsiTYKGE5KgyG2IVgIPiNRAEQZ9fWCo+0pXRXIVq9Vhc3uLVxc0viYJv25aHoKy34OjRStgVqX7fKXh2/B3G/7Bd5vUXVckJdtcgisVIUiCw+EnArZw34TL8PqLlyuC3SE7NqA0+H5/cUxqcq7rHltXUwdDyrqb+yicvfPDDH7NNiz3+xadk5XMPOmScFkYOyUJf2SvTjin82tBMksdDzsKVLpFOIJCGW8Ltz+BLc7YhLq3E8bgrpyz5q0zhWPwe3A0+/8h+tHrhHdUi1zaqRyPYKZwGdXqMEng2aokqXFR5qEFG2El4Z+K8HnRIpC69LTScNzKjpXh0SzDCwMWQh7nGL9oxR08BTeOqX8HVH/xgtQFtIrtBHcIPidaFIUKPGW3wuGTVAVTZZhsoyOd1/kWCGyCjY0r4ySRWjzfzmVb2cz/S/bL7T0Rdgk7RJKoVofZrHZJ8H0q6U6O0Zi9A9jRrKvZsWHZCKVRW0+AhuOyAreKpF1Uq5uuNC35NKIpk6XhRNRNlirDeEn4i+0kBN8tw3iRIAqEd5jsAe+SeV+UmBCcw7W4+z+Ioy1FxZsUwVHrSdC4NuncriL4yGwLYGpymxRjAp1rdeKrw1EEHWHsAdsPkSDk2tK59aqKhrYgkWoLqYu3W+hjP/Z2yS2jLAleN8mQSJxLaXjf0PARv6fz7Ljb7XDMKHMo25RPiH0l1ktJfjcsvaJICMoxo2yKf3GeIVaXlEMJZiOYXCaL4VVwYq0O1Hol9CflkXCa09R+rOUtxhnXuF6kAI/g2VD2QOOHSckiNWwytN0ZW2NBoWzDCYAZIiVIR4yyKuMsQ9sbY2mI3UrjBoSrF1KCv9UfyerF2h5oPMbqK245VAUnGNr9mw129IbKOMnQ0N60q4xn9rx9Xsja0l9jDxkHyRvc36jdoAI7KvigQ8MJIFglMoDngFE2pTAlwcvRGyFc2rgRnCcygpexUVYaFhjaXBy5keDIT6NlpnFKLL1pQaMcJGwaT/iXkRsxVbnx6RaRIfwMjbLXV7rRMNlbIjciNf7QcAX0LbpYZIyZGRnloCC4sQ3YFblzptLyNEsKXQtfc+zLYB/3i6gweRqJJiAcN8o8gQYVdFS00wRIi4TRvycA3m2FCWgJFeRVcGIYFcSGu1VUUG6EszTCuRuatRuab8Sy3ojhEldDETJloxs2FMH0C5EbyYNxGQfjmPLFoOf2tWM42q/6w03haKlLd0dviF0tQ0KGc6Sx9KqFEjJzejuvTSUhw2C+nUaN8Tlc0WYpSalhdiopSQafrTV0coNoA6MbLk8e4/Gl4CiSaaknnBf2HMiADULq0jUWMjwQM5VY45pIXiWiTQqzlMaSQSMMxF4oLAnfM3Q8L02kBFUfH2a2MHjzh6rRHYTU8KZxBWq4WSRyVCfgWGu09OFgnNQDyrHydFZrTCpikGNbYvsiqwGJqfLAyyC8bIIk+Nh8E5ReSEyAWgICfjIMxAlWV0PJ6DIKZbjL4ibYk3iCShG+aiVIk4maDsfOAwySkdgwwcQS+7E8K2Dk+uRAVTO6UDpmdGtHs/AzC1m2pcY/yrXvdqoBPNHikIRz7fpaujddwWyoXWpBvJYh6TgFaYeZOUXjCpEFWYcNHWVAeJEVo0gESI2P2ZB1cEg6My65gDPCilsH/kru/Gz8UITPOE9XMwg+nBeCg9NzmrG8GtT8zw3BIbcwa5EDt5F5NUN4LavZrROOwWcCPztvZ1Dvf+UEZdkgmYUpPn7SJOzmg9/CEQSbLA17Qgz+Zud479gQhWdGh8+zJMnm3DJTZ4ajrYRdSe+6mwaTmjZBT3+IyzuSOGXf8OAh4RsWgbX/DH6h0nWZcBlBxDCUOsLBzh3m88hJJviDTFYtmXIkrHxBXtzVO///bQL2hu4k1SeDD0HzOdwKTuDyj6blqPrDuXohSKAbCgtMBtc5nW/lHWlcFJm+nnB/sOvWsEBS8UlVgRs8gkvZa+HIY3D1F8fwe/xZnWhvQf030R4KVJN9od/jnyZaFXVu0TSejlSN9WKZyzBZDAVwVRqT+GU+qGStclY4T1XfDGSleKck+M7hgd/u6eL9YiijllUrTWOCO+WOutnDyZS2ep5YUONZhqnMsZbh4G/jHK5L59wyfZShNFQbx3TljzI8FfwefxRn22rPkoFNXGEcdcDr/7GRCZS4XLCt1ExUeOu6xzLlC+tnqaGbj/zUN1Q7ORk0+DjbemJoZ/AZf4dwsdLFl/i3sZWI58iRI0eOHDly5MiRI4eIB/8AUgpRRKGawxoAAAAASUVORK5CYII="/>
                        </defs>
                    </svg>
                </div>
            </div>
        </div>
    </div>

<%--  productList modal  --%>
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal body -->
                <div class="modal-body">
                    <div id="sort"><img src="${pageContext.request.contextPath}/resources/image/productImgae/product1.png"></div>
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <div id="modal-footer-title"><span>1025 독도 앰플 45g</span></div>
                    <div id="modal-footer-note" class="modal-footer-font"><span>독도 앰플은 독도 100주년 기념하여 만든 앰플이며 피부에 아주 좋은 앰플입니다.</span></div>

                    <div id="modal-footer-both">
                        <div id="modal-footer-price"><span>15,600원</span></div>
                        <div><button type="button" class="btn btn-danger" data-dismiss="modal">Close</button></div>
                    </div>

                </div>

            </div>
        </div>
    </div>
</div>

<script>
    $('#onModal').click(function (){
        $('#myModal').fadeIn(10000);
        $('.modal-content').fadeIn(10000);
    })
</script>

<jsp:include page="../common/crm/footer.jsp"/>
</body>
</html>
