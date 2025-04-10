function backCrmPage(){
    if(confirm('상품 구매 페이지로 돌아가시겠습니까?')){
        location.href = '/';
    }
}

function logout() {
    const checkLogout = confirm('정말 로그아웃 하시겠습니까?');

    if (checkLogout) {
        location.href = 'logout.me';
    }
}