function init(postId1){
    drawReplyList({postId : postId1})
}

function addReply(loginUser,postId1){
    //댓글내용, 작성자, 게시글번호
    const postId = postId1;
    const userId = loginUser;
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
            console.log("reply insert ajax 요청 실패1");
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
            console.log("reply insert ajax 요청 실패2");
        }
    })
}


function deleteReplyClick(){
    let data1 = document.getElementById('data');
    //로그인 한 유저
    let user = data1.dataset.loginuser;
    //작성한 게시판 번호
    let boardNo = data1.dataset.postid;
    //로그인 한 유저의 직위
    let jobCode = data1.dataset.jobcode;

    
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

            if(user === writer || jobCode === "J5"){
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
    const data1 = document.getElementById('data');
    alert("삭제되었습니다.");
    location.href='detail.bo?bno=' + data1.dataset.postid;
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