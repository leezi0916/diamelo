    // 날짜 2개 받아온거 비교하기
    function checkDate() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);
    const today = new Date();

    const sDate = startDate ? new Date(startDate) : null;
    const eDate = endDate ? new Date(endDate) : null;
    if (sDate && eDate && sDate > eDate) {
    alert("시작일은 종료일보다 빠르거나 같아야 합니다.");
    return false;
}
}

