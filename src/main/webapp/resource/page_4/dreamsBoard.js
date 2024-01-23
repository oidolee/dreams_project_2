/**
 * 
 */
 
 // dreamsBoardWrite.jsp
 // 제목 글자수 제한
 function titleLength(el, maxlength){
	if(el.value.length > maxlength){
		el.value = el.value.substr(0, maxlength);
	}
}

function writeLength(el, maxlength){
	if(el.value.length > maxlength){
		el.value = el.value.substr(0, maxlength);
	}
}

var clear = false;
function clearTextarea() {
	if(!clear){
		document.getElementById('writeTextarea').value = '';
		 clear = true;
	}
}

function searchBoard() {
	if(!document.boardform.search.value){
		alert("키워드를 입력하세요!");
		document.boardform.search.focus();
		return false;
	}
	
	let url="/dreams_project_2/dreamsBoardSearch.do?search=" + document.boardform.search.value;
	
	
}