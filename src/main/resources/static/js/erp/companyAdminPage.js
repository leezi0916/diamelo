function allCheck(_allCheckBox){
    //전체선택 체크여부
    let checked = _allCheckBox.checked;

    let userId = document.getElementsByName("userId");
    for(let box of userId){
        box.checked = checked;
    }
}

function isAllchecked(selector){
    const checkBoxList = document.querySelectorAll(selector);
    for(let box of checkBoxList){
        if(!box.checked){
            return false;
        }
    }
    return true;
}

function addstatusEvent(){
    const allcheck = document.getElementById('allcheck');
    let userId = document.getElementsByName("userId");

    for(let box of userId){
        //모든 체크박스의 체크여부를 확인해서 결과에따라
        //all체크박스의 체크여부를 변경한다.
        box.onclick = function(){
            let isChecked = isAllchecked('input[name="userId"][type="checkbox"]');
            allcheck.checked = isChecked;
        }
    }
}
addstatusEvent();

// 삭제 여부
function onalert(){
    if(confirm("정말 삭제하시겠습니까?")){
    }else{
        return false;
    }
}

// userId 값 가져와서 status = 'Y'
function commitCompany(){
    //checkBox전체 가져와서
    //선택된 녀석들의 value만 모아서
    //ajax요청

    //체크박스
    const checkBox = document.querySelectorAll('.checking:checked');
    //체크박스 값
    const selectedValues = [];

    checkBox.forEach((el)=>{
        selectedValues.push(el.value);
    })

    if(confirm("거래처를 승인하시겠습니까?")){
        updateCompanyStatusY({
            userId : selectedValues
        },drawCompanyListY)
    }else{
        alert('취소하였습니니다.');
        return false;
    }
}

function drawCompanyListY(data){
    alert("승인 완료되었습니다.");
    location.href='compAdmin.erp';
}

function updateCompanyStatusY(data, callback){
    $.ajax({
        url: '/api/company/commit',
        type: 'post',
        data : JSON.stringify(data),
        contentType: 'application/json',
        success:function (res){
            if(res === "success"){
                callback(data);
            }else{
                alert("이미 처리된 거래처가 있거나 선택하지 않았습니다.");
                console.log("status update 실패");
            }
        },
        error: function (){
            console.log("status update ajax 요청 실패");
        }
    })
}

//userId 값 가져와서 status = 'N'
function returnCompany(){
    //체크박스 값
    const checkbox = document.querySelectorAll('.checking:checked');
    //체크박스 값을 배열에 저장
    const selectValues = [];

    checkbox.forEach((checkbox)=>{
        selectValues.push(checkbox.value);
    })

    console.log(checkbox);

    if(confirm("거래처를 반려하시겠습니까?")){
        updateCompanyStatusN({
            userId : selectValues
        },drawCompanyListN)
    }else{
        alert("취소하셨습니다.");
        return false;
    }
}

function drawCompanyListN(data){
    alert("반려되었습니다.");
    location.href="compAdmin.erp";
}

function updateCompanyStatusN(data, callback){
    $.ajax({
        url: "/api/company/return",
        type: "post",
        data: JSON.stringify(data),
        contentType: 'application/json',
        success : function (res){
            if(res === "success"){
                callback(data);
            }else {
                alert("이미 처리된 거래처가 있거나 선택하지 않았습니다.");
                console.log("status update 실패");
            }
        },
        error: function (){
            console.log("ajax status update 실패");
        }
    })
}