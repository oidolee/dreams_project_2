<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>관리자 - 게시판관리</title>
    <!-- 반응형 웹-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="${path}/resources/css/common/header.css">
    <link rel="stylesheet" href="${path}/resources/css/common/footer.css">

    <script src="https://kit.fontawesome.com/48086a0d4e.js" crossorigin="anonymous"></script>
    <!-- (3-3-2). 자바스크립트 소스 추가 :  -->
    <!-- defer : 모든 html 파일을 로딩할때까지 html이 브라우저창에 표시가 안되는 것을 방지 -->
    <script src="${path}/resources/js/customer/main.js" defer></script>
    
    <script>
    	$(function() {
		    $('#btnInsert').click(function(){
		    	location.href="${path}/board_insert.bc";
		    })
    	})
    </script>

<style>

#container {
   width: 100%;
   margin: 0 auto;
}

#contents {
   max-width: 1100px;
   min-width: 1100px;
   width: 100%;
   margin: 0 auto;
   min-height: 800px;
}

#section2 {
   display: flex;      /* 한줄(수평)로 배치 */
   justify-content: space-between;
}


-----------------------------

/* 우측내용 시작 */
#right {
   width: 88%;
}

.table_div {
   margin-top: 30px;
}

.table_div  table {
   border-collapse: collapse;
   width: 800px; 
   align: center;
}

.table_div  table th {
   background: #FDE3E9;
}

.table_div  table th, td {
   height: 50px;
   border: 1px solid black;
   padding-left: 2px;
   text-align: center;
}

.input {
   width: 550px;
   height: 40px;
   border: 1px solid gray;
   padding: 0 0 0 10px;
}

.inputButton {
   background: dark-yellow;
   font-size: 16px;
   padding: 5px 10px 5px 10px;
}
</style>    

</head>
<body>
    
    <div class="wrap">
        <!-- header 시작 -->
        <!-- header 끝 -->
        
        <!-- 컨텐츠 시작 -->
        <div id="container">
            <div id="contents">
                <!-- 상단 중앙1 시작 -->
                <div id="section1">
                    <h2 align="center"> 게시글목록 </h2>
                </div>

                <!-- 상단 중앙2 시작 -->
                <div id="section2">
                    <!-- 좌측메뉴 시작 -->
                    <!-- 좌측메뉴 종료 -->

                    <!-- 우측메뉴 시작 -->
                    <div id="right">
                        <div class="table_div">
                            
                            <form name="ad_productList" method="post">   <!-- post : 노출x / get : 노출o -->
                                <table>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">아이디</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">생년월일</th>
                                        <th scope="col">비고</th>
                                    </tr>
                                	<c:forEach var="dto" items="${list}">
	                                    <tr class="cursor_point" onclick="goToDetails('${dto.cust_No}', '${dto.cust_Id}', '${dto.cust_Name}', '${dto.cust_Birth}', '${dto.show}')">
	                                   
	                                        <td>${dto.cust_No}</td>
	                                        <td>${dto.cust_Id}</td>
	                                        <td>${dto.cust_Name}</</td>
	                                        <td>${dto.cust_Birth}</</td>
	                                        <td>${dto.show}</</td>
	                                        
	                                    </tr>
                                    </c:forEach>
                                         <tr>
			                        	<td colspan="5" align="center">
					                         <!-- 페이징 처리 -->
					                         <!-- 이전 버튼 활성화 -->
					                         <c:if test="${paging.startPage > 0}">
					                         	<a href="${path}/admin_member.cc?pageNum=${paging.prev}">[이전]</a>
					                         </c:if>
					                         
				                        	<!-- 페이지 번호 처리 -->
				                        	<c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
				                        		<a href="${path}/admin_member.cc?pageNum=${num}">${num}</a>
				                        	</c:forEach>
				                        	
				                        	<!-- 다음 버튼 활성화 -->
				                        	<c:if test="${paging.endPage < paging.pageCount}">
					                         	<a href="${path}/admin_member.cc?pageNum=${paging.next}">[다음]</a>
					                        </c:if>
				                    	</td> 
                   					</tr> 
                                </table>
                            </form>
                        </div>
                    </div>
                    <!-- 우측메뉴 종료 -->
                </div>
            </div>
        </div>
        <!-- 컨텐츠 끝 -->
        
        <!-- footer 시작 -->
        <!-- footer 끝 -->
    </div>
</body>
</html>