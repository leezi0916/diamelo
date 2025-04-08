<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Diamelo</title>
    <link rel="stylesheet" href="/css/erp/erpLayout.css"/>
    <link rel="stylesheet" href="/css/default.css"/>
    <link rel="stylesheet" href="/css/erp/boardDetailViewStyle.css"/>
</head>
<body onload="init()">
<div class="layout-wrapper">
    <!-- 왼쪽 고정 사이드바 -->
    <jsp:include page="../common/erp/sidebar.jsp"/>

    <!-- 오른쪽 상단바 + 콘텐츠 -->
    <div class="main-area">
        <jsp:include page="../common/erp/header.jsp"/>

        <!-- 페이지 본문 -->
        <div class="page-body">
            <div class="page-body-header">
                <div class="page-body-header-text">
                    게시글 보기
                </div>
            </div>

            <div id="page-body-content">
                    <div id="header">
                        <div id="category">
                            <div id="category0">
                                <c:choose>
                                    <c:when test="${b.type == '1'}">
                                        공지사항
                                    </c:when>
                                    <c:otherwise>
                                        문의사항
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </div>
                        <div id="title">
                            <div id="title0">제목</div>
                            <div id="title1"><input type="text" readonly value="${b.title}"></div>
                        </div>
                        <div id="userId">
                            <div id="userId0">작성자</div>
                            <div><input type="text" readonly placeholder="${b.userId}"></div>
                        </div>
                    </div>

                    <div id="content">
                        <div id="content-name">내용</div>
                        <div id="content-input">
                            <textarea readonly>${b.content}</textarea>
                        </div>
                    </div>

                    <div id="reply">
                        <div id="reply1">
                            <div id="reply-name">댓글 달기</div>
                            <div id="replyBtn">
                                <button id="addBtn" onclick="addReply()">댓글 작성</button>
                            </div>
                        </div>
                        <div id="reply2">
                            <div id="reply-input">
                                <textarea id="reply-text" name="textarea"></textarea>
                            </div>
                        </div>
                    </div>
            </div>

            <div id="reply-content">
                <div id="reply-header"><h4>댓글(<span id="rCount">0</span>)</h4></div>
                <div id="reply-inner"></div>

            </div>

            <div id="page-body-backBtn-div">
                <button id="backBtn" type="button" onclick="location.href='board.erp'">뒤로 가기</button>
            </div>
        </div>
    </div>
</div>

<script>
    function init(){
        drawReplyList({postId : ${b.postId}})
    }

    function addReply(){
        //댓글내용, 작성자, 게시글번호
        const postId = ${b.postId};
        const userId = "${loginUser.userId}";
        const content = document.querySelector('#reply-text').value;

        insertReply({
            postId: postId,
            writer : userId,
            content : content
        }, drawReplyList)
    }

    function drawReplyList(data){
        getReplyList({postId:data.postId}, function (replyList){
            const countSpan = document.querySelector("#rcount");
            countSpan.innerHTML = replyList.length;

            let info = "";
            for(let reply of replyList){
                info += "<div id='reply-inner'>"
                            + "<div id='reply-content1'>"
                                + "<div id='reply-content-name'>" + "<span>" + reply.user_id + "</span>" + "</div>"
                                + "<div id='reply-content-createDate'>" + "<span>" + reply.create_date + "<button class='icon-button' type='button' onclick='return deleteReplyClick()'>" + "<img src='/image/delete_icon.png' alt='삭제' width='20'>" +"</button>" +"</span>" + "</div>"
                            + "</div>"
                            + "<div id='reply-content-inner'>" + "<textarea readonly>" + reply.reply_content + "</textarea>" + "</div>"
                        + "</div>";
            }

            const contentBody = document.querySelector("#reply-inner");
            contentBody.innerHTML = info;
        })
    }

    function getReplyList(data, callback){
        $.ajax({
            url: '/api/board/reply',
            type: 'get',
            data : data,
            success : function (res){
                callback(res);
            },
            error:function (){
                console.log("reply insert ajax 요청 실패");
            }

        })
    }

    function insertReply(data, callback){
        $.ajax({
            url: '/api/board/reply',
            type: 'post',
            data: data,
            success:function(res){
                if(res === "success"){
                    callback(data);
                }else{
                    console.log("reply insert 실패");
                }
            },
            error: function (){
                    console.log("reply insert ajax 요청 실패");
            }
        })
    }

    function deleteReplyClick(){
        //로그인 한 유저
        const user = "${loginUser.userId}";
        //작성한 게시판 번호
        const boardNo = ${b.postId};

        if(confirm("정말 삭제하시겠습니까?")){
            getReply(boardNo , function(replylist){
                let replyNo = null;
                let writer = null;
                for(let reply of replylist){
                    //작성한 댓글 번호
                    replyNo = reply.reply_no;
                    //작성자
                    writer = reply.user_id;
                }

                if(user === writer){
                    deleteReply({
                        postId : boardNo,
                        writer : writer,
                        repNo : replyNo
                    },drawDeleteReply)
                }else{
                    alert("권한이 없습니다.");
                }
            })
        }else{
            return false;
        }

    }

    function drawDeleteReply(data){
        alert("삭제되었습니다.");
        location.href='detail.bo?bno=' + ${b.postId};
    }

    //댓글 찾아오기
    function getReply(data, callback){
        $.ajax({
            url: '/api/board/delete',
            type: 'get',
            data: {postId : data},
            success : function (res){
                callback(res);
            },
            error : function (){
                console.log('reply delete ajax 요청 실패1');
            }
        })
    }

    //댓글 삭제
    function deleteReply(data, callback){
        $.ajax({
            url: '/api/board/delete',
            type: 'post',
            data: data,
            success : function (res){
                if(res === "success"){
                    callback(data);
                }else{
                    console.log('reply delete 실패');
                }
            },
            error : function (){
                console.log('reply delete ajax 요청 실패2');
            }
        })
    }
</script>
</body>
</html>
