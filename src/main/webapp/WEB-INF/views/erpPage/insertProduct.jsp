<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Diamelo</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/erp/erpLayout.css" />


  <%-- Noto Sans KR Font--%>
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;700;900&display=swap" rel="stylesheet">

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
  <style>

    .page-body{
      height: 100%;
      display: flex;
      flex-direction: column;
      align-items: center;

    }
    .page-body{
      padding-left: 10%;
      padding-right: 10%;

    }

    .page-body-header{
      height: 100px;
      width: 100%;

      align-content: center;
      font-size: 24px;
      font-weight: 500;
      left: 30px;
      padding-top: 30px;

      border-bottom: 1px solid black;
      padding-left: 5%;
      padding-right: 5%;

    }
    .page-body-content{
      margin-top: 2%;
      border-radius: 15px;
      width: 100%;
      height: 700px;
      background-color: #ffffff;
      box-shadow: 0px 4px 4px 0 rgba(0, 0, 0, 0.25);

    }

    #page-body-header-text{
      padding-left: 5%;
    }

    #ingrediant_area{
      width: 80%;
      height: 600px;
      margin: 50px auto;
    }

    #ingre_upper{
      width: 100%;
      height: 300px;
      display: flex;
      align-items: start;
    }
    #ingre_lower{
      width: 100%;
      height: 300px;
    }

    #ingre_upper_left{
      align-content: center;
      width: 50%;
    }

    #ingre_upper_left *{
      justify-content: center;
    }

    #ingre_upper_right{
      width: 50%;
      display: flex;
      flex-direction: column;
      align-items: start;


    }



    #ingre_lower_memo{
      height: 250px;
    }

    #ingre_lower_button{
      height: 50px;
    }

    .input-box {
      width: 100%;
      max-width: 200px;
      height: 50px;
      background: white;
      border-radius: 15px;
      border: 1px solid #000000;
      display: flex;
      align-items: center;
      font-size: 20px;
      font-weight: 400;
      color: #000000;
      margin: 0px 0px 0px 0px;
      padding-left: 10px;
      outline: none;
    }

    .input-boxs{
      width: 100%;
    }

    .input-name > p{
      margin: 0px 5px;
      font-size: 20px;
      font-weight: 500;
      color: #000000;
      width: 80px;
      height: fit-content;
    }

    .star{
      font-size: 25px;
      color: #E73C40;
      align-items: center;
      width: fit-content;
      height: fit-content;

    }

    .input-name{
      display: flex;
      align-items: center;
      margin-top: 20px;


    }

    input::placeholder{
      font-size: 20px;
      color: #A9A9A9;
    }

    #ingre_image{
      height: 190px;
      margin-top: 15px;
    }

    #text{
      margin: auto;
      font-size: 20px;
      font-weight: 500;
      color: #000000;
      width: fit-content;
      margin-top: 8px;

    }

    #insert_image {
      width: 150px;
      height: 180px;
      border: 1px solid black;
      background: #fbfbc8;
      display: flex;
      align-items: center;
      justify-content: center;
      cursor: pointer;
      background-size: cover;
      background-position: center;
      background-repeat: no-repeat;
      overflow: hidden;
    }

    #input-memo-area{
      display: flex;
      align-items: center;
      width: 100%;
      height: 80%;
      justify-content: center;

    }

    #memo{
      height: fit-content;

      margin: 0;

      margin-right:80px ;
      font-size: 20px;
      font-weight: 500;
      color: #000000;
    }

    #input-memo-box{
      width: 60%;
      height: 80%;
      background: white;
      border-radius: 15px;
      border: 1px solid #000000;
      display: flex;
      justify-items: center;
      font-size: 20px;
      font-weight: 400;
      color: #000000;
      margin: 0px 0px 0px 0px;
      padding-left: 10px;
      outline: none;
    }

    #ingre_lower_button{
      display: flex;
      padding: 0px 50px;
      gap: 100px;
    }


    .button {
      width: 100%;
      height: 50px;
      background: #7AC38F;
      box-shadow: 0px 3px 3px rgba(0, 0, 0, 0.2);
      border-radius: 12px;
      text-align: center;
      font-size: 16px;

      font-weight: 500;
      color: white;
      display: flex;
      align-items: center;
      justify-content: center;

      cursor: pointer;
      transition: background-color 0.3s, transform 0.2s; /* 부드러운 효과 */

      border: none;

    }

    .button:hover {
      background-color: #529471;
    }

    #bigo{
      flex-grow: 1;
      width: auto;

      height: 50px;
      background: white;
      border-radius: 15px;
      border: 1px solid #000000;
      display: flex;
      align-items: center;
      font-size: 20px;
      font-weight: 400;
      color: #000000;
      margin: 0px 0px 0px 0px;
      padding-left: 10px;
      outline: none;
    }

    #category{
      width: 100%;
      align-items: end;


    }

    .select{
      height: 50px;
      border-radius: 15px;
      align-items: center;
      font-size: 20px;
      font-weight: 500;
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
      <div class="page-body-header">
        <div id="page-body-header-text">
          제품정보 등록
        </div>
      </div>

      <form class="page-body-content">
        <div id="ingrediant_area">
          <div id="ingre_upper">
            <div id="ingre_upper_left">
              <div class="input-boxs">

                <div class="input-name">
                  <div class="star">*</div><p>재료명</p>
                  <input class="input-box" type="text" placeholder="NAME"></input>
                </div>

                <div class="input-name">
                  <div class="star">*</div><p>생성일자</p>
                  <input class="input-box" type="text" placeholder="DATE"></input>
                </div>


              </div>
            </div>

            <div id="ingre_upper_right">
                <div class="input-boxs">

                  <div class="input-name">
                    <p>비고</p>
                    <input id="bigo"  type="text" placeholder="MEMO"></input>
                  </div>

                  <div class="input-name">

                    <p>가격</p>
                    <div><input class="input-box" type="text" placeholder="PRICE"></div>

                    <div id="category">
                      <select name="category" class="select">
                        <option disabled selected>카테고리</option>
                        <option value="apple">스킨</option>
                        <option value="orange">로션</option>
                        <option value="grape">선크림</option>
                        <option value="melon">미용</option>
                      </select>
                    </div>


                  </div>


                </div>
              </div>
            </div>

          <div id="ingre_lower">
            <div id="ingre_lower_memo">
              <div id="input-memo-area">
                <div id="memo">비고</div>
                <textarea id="input-memo-box" type="text" placeholder=""></textarea>
              </div>
            </div>

            <div id="ingre_lower_button">
              <button class="button" type="submit">+재료등록</button>
              <button class="button">돌아가기</button>
            </div>

          </div>


        </div>
      </form>

    <script>
      document.addEventListener("DOMContentLoaded", function() {
        const insertImageDiv = document.getElementById("insert_image");
        const imageUploadInput = document.getElementById("imageUpload");

        // 클릭 이벤트 로그 확인
        insertImageDiv.addEventListener("click", function() {
          console.log("insert_image 클릭됨");  // ✅ 디버깅용
          imageUploadInput.click();
        });

        imageUploadInput.addEventListener("change", function(event) {
          const file = event.target.files[0];
          if (file) {
            console.log("파일 선택됨:", file.name);  // ✅ 디버깅용
            const reader = new FileReader();
            reader.onload = function(e) {
              console.log("이미지 로딩 완료");  // ✅ 디버깅용
              insertImageDiv.style.backgroundImage = `url(${e.target.result})`;
              insertImageDiv.style.backgroundSize = "cover";
              insertImageDiv.style.backgroundPosition = "center";
              insertImageDiv.style.backgroundRepeat = "no-repeat";
              insertImageDiv.textContent = "";
            };
            reader.readAsDataURL(file);
          }
        });
      });

    </script>
</body>
</html>
