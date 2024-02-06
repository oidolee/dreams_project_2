

// 각 행을 클릭했을 때 실행될 함수
function goToDetails(cust_No, cust_Id, cust_Name, cust_Birth) {
	
    // 세부 정보를 전달할 URL 생성
    var url = "/dreams_project_2/admin_memberDetail.cc?cust_No=" + encodeURIComponent(cust_No) +
              "&custId=" + encodeURIComponent(cust_Id) +
              "&custName=" + encodeURIComponent(cust_Name) +
              "&custBirth=" + encodeURIComponent(cust_Birth);
    
    // 새로운 페이지로 이동
    window.location.href = url;
}

// memberDetail - 뒤로가기
function back_cust() {
	// 이전 페이지로 이동
	history.back();
}

function delete_cust() {
	window.location.href = "/dreams_project_2/admin_delete_cust.cc";
}