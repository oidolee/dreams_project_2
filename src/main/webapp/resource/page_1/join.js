
// -- [회원가입 페이지]

// 이메일
function selectEmailChk() {
    // select 박스에서 이메일 주소를 선택시 해당값이 들어가도록 한다.
    if(document.joinform.email3.value == 0) {  // 직접입력인 경우
        document.joinform.email2.value = "";
        document.joinform.email2.focus();
        return false;	// false : 이벤트 핸들러의 기본 동작을 중단
    }
    else {
        document.joinform.email2.value = document.joinform.email3.value;
        return false;
    }
}

// 아이디 중복확인 버튼 클릭시
// 1. 중복확인 페이지 open
function confirmId() {
	// alert("중복확인");
	if(!document.joinform.userid.value) {
		alert("아이디를 입력하세요!!");
		document.joinform.userid.focus();
		return false;
	}
	
	let url="/dreams_project_2/idConfirmAction.cc?userid=" + document.joinform.userid.value;
	window.open(url, "confirm", "menubar=no, width=900, height=400")
	// 컨트롤러 url을 넘기므로 컨트롤러에 url 추가
}

// 2. join.jsp - onsubmit - 회원가입 페이지 필수체크
function signIncheck() {
	// 2-1. 중복확인
	// <input type="hidden" name="hiddenUserid" value="0">
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	
	// 2-2. 중복확인 버튼을 클릭하지 않는 경우 "중복확인 해주세요!!" 메세지 띄운다.
	if(document.joinform.hiddenUserid.value == 0) {
		alert("중복확인 해주세요!!");
		document.joinform.userid.focus();
		return false;
	}
}

// -- [중복확인 페이지]

// 3. idConfirmAction.jsp - onload
function idConfirmFocus() {
	document.confirmform.userid.focus();
}

// 4. idConfirmAction.jsp - submit
function idConfirmCheck() {
	if(!document.confirmform.userid.value) {
		alert("아이디를 입력하세요!!");
		document.confirmform.userid.focus();
		return false;
	}
}

// 5. 자식창에서 부모창으로 userid값을 전달 => 사용가능한 id를 찾은경우
/*
 	opener : window 객체의 open() 메서드로 열린 자식창(=중복확인창)에서 부모창(=회원가입창)에 접근할 때 사용
	// hiddenUserid : 중복확인 버튼 클릭여부 체크(0:클릭안함, 1:클릭함)
	self.close();	// 자식창 닫기
*/
function setUserid(userid) {
	opener.document.joinform.userid.value = userid;
	opener.document.joinform.hiddenUserid.value = "1";
	self.close();
}

// -- [회원상세 페이지]
// 이메일
function selectEmailChk_detail() {
    // select 박스에서 이메일 주소를 선택시 해당값이 들어가도록 한다.
    if(document.modifyform.email3.value == 0) {  // 직접입력인 경우
        document.modifyform.email2.value = "";
        document.modifyform.email2.focus();
        return false;	// false : 이벤트 핸들러의 기본 동작을 중단
    }
    else {
        document.modifyform.email2.value = document.modifyform.email3.value;
        return false;
    }
}


// -- [회원정보 입력 페이지]
function inputChk() {

	// 아이디 입력확인
	if (!document.joinform.userid.value) {
		alert("아이디를 입력해주세요");
		document.joinform.userid.focus();
		return false;	// 동작 중지
	}

	// 비밀번호 입력확인
	if (!document.joinform.userpwd.value) {
		alert("비밀번호를 입력해주세요");
		document.joinform.userpwd.focus();
		return false;	// 동작 중지
	}

	// 비밀번호 재입력확인
	if (!document.joinform.userrepwd.value) {
		alert("비밀번호를 재입력해주세요");
		document.joinform.userrepwd.focus();
		return false;	// 동작 중지
	}
	
	// 비밀번호와 비밀번호 재입력 불일치
	if (document.joinform.userpwd.value != document.joinform.userrepwd.value) {
		alert("비밀번호가 일치하지 않습니다");
		document.joinform.userpwd.focus();
		return false;	// 동작 중지
	}
	
	// 이름 입력확인
	if (!document.joinform.username.value) {
		alert("이름을 입력해주세요");
		document.joinform.username.focus();
		return false;	// 동작 중지
	}

	// 생년월일 입력확인
	if (!document.joinform.birthday.value) {
		alert("생년월일을 입력해주세요");
		document.joinform.birthday.focus();
		return false;	// 동작 중지
	}
	
	// 주소 입력확인
	if (!document.joinform.post1.value) {
		alert("우편번호를 입력해주세요");
		document.joinform.post1.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.post2.value) {
		alert("우편번호를 입력해주세요");
		document.joinform.post2.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.adress1.value) {
		alert("기본주소를 입력해주세요");
		document.joinform.adress1.focus();
		return false;	// 동작 중지
	}
	if (!document.joinform.adress2.value) {
		alert("나머지주소를 입력해주세요");
		document.joinform.adress2.focus();
		return false;	// 동작 중지
	}

	// 연락처 입력확인
	if (!document.joinform.hp1.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.hp1.focus();
	return false;	// 동작 중지
	}
	if (!document.joinform.hp2.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.hp2.focus();
	return false;	// 동작 중지
	}
	if (!document.joinform.hp3.value) {
	alert("휴대폰번호를 입력해주세요");
	document.joinform.hp3.focus();
	return false;	// 동작 중지
	}

	// 이메일 입력확인
	if (!document.joinform.email1.value) {
	alert("이메일을 입력해주세요");
	document.joinform.email1.focus();
	return false;	// 동작 중지
	}
	if (!document.joinform.email2.value) {
	alert("이메일을 입력해주세요");
	document.joinform.email2.focus();
	return false;	// 동작 중지
	}
}