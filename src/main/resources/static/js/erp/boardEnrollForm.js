function insertBoard(){
    const select = document.getElementById("selectOption").value;
    const title = document.querySelector('input[name="title"]').value;
    if(select === "0"){
        alert('분류를 선택하지 않았습니다.');
        return false;
    }
    if(title === ""){
        alert('제목을 입력해주세요.');
        return false;
    }
}