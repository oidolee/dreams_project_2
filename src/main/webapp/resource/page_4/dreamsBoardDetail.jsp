<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈게시판 상세</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resource/css/common/common.css">
    <link rel="stylesheet" href="${path}/resource/css/index.css">
    <link rel="stylesheet" href="${path}/resource/css/common/page4_board.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="${path}/resource/js/common/header.js"></script>

    <script>
        // 페이지 로드 후 실행될 함수
        $(document).ready(function () {
            // top 버튼 클릭 시 스크롤
            $('#goTop a[href="#header"]').on('click', function (e) {
                window.scroll({
                    top: 0,
                });
                checkButton();
            });

            $(".floating-box.center").on("click",function(){
                $(".first-bg").hide();
            })
        });

        //크롬 스크롤 오류로 시간 지정 후 동장
        $(window).on("scroll", function () {
            $("#goTop a").attr("href", "#none")
            $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.1)" });
            setTimeout(() => {
                $("#goTop a").attr("href", "#header")
                $("#goTop").css({ "background-color": "rgba(255, 255, 255, 0.7)" });
            }, 2000);
        })

    </script>
</head>
<body>
  
	<div class="wrap">
    	<%@ include file="/layout/header.jsp" %>
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resource/image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
        	<form name="boardDetailForm" method="post">
				<div style="display: flex; justify-content: center;"class="board">
					
                <!-- 좌측메뉴 시작 -->
				<%@ include file="/resource/page_4/boardLeftMenu.jsp" %>
				<!-- 좌측메뉴 종료 -->	
				<!-- 우측메뉴 시작 -->
                <div style="width: 800px; " >
					<h2 align="center" class="title"> 드림즈 게시판 </h2><br>
                    <table id="boardDetail">
                        <tr>
                            <th colspan="3" style="font-size: 25px;">
                                ${dto.board_Title}
                            </th>
                        </tr>
                        
                        <tr>
                            <td style="font-size: 13px; width: 500px;">
                            ${dto.cust_Id}
                            </td>
                       
                            <td style="font-size: 13px; width: 250px;">
                            ${dto.board_Date}
                            </td>
                        
                            <td style="font-size: 13px;">
                            <button type="button" style="background-color: white; border-color: white;">신고</button>
                            </td>
                        </tr>

                        <tr style="height: 200px;">
                            <td colspan="3">
                            <pre>
								${dto.board_Content}
                            </pre>
                            </td>
                           
                        </tr>
                        
                    </table>
                
                    <hr id="blackline">
                    <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                        <div id="detailbutton">
                        	<input type="hidden" name="hidden_num" value="${dto.board_No}">
                            <a href="dreamsBoardDetail.bc?board_No=${dto.board_No - 1}" style="margin-right: 250px;"> < 이전 </a>
                            <a href="dreamsBoard.bc"> 목록 </a>
                            <a href="dreamsBoardDetail.bc?board_No=${dto.board_No + 1}" style="margin-left: 250px;"> 다음 > </a>
                        </div>
                    </div>
	                <c:if test="${sessionScope.sessionID == dto.cust_Id}">		<!-- 세션아이디가 게시글 등록자와 같으면 수정 삭제 버튼 생성 -->
	                    <div style="display: flex; justify-content: right; margin-bottom: 50px;">
	                        <div id="writebutton">
	                        	<input type="button" value="수정" onclick="location.href='dreamsBoard.bc'">
	                        	<input type="button" value="삭제" onclick="location.href='dreamsBoard.bc'">
	                        </div>
	                    </div>
	                </c:if>
                    <div>
                        <div style="display: flex; justify-content: left;">
                            <table id="reveiw" style="margin-bottom: 50px; width: 100%;">
                                <tr  style="border-bottom: 2px solid gray;">
                                    <td style="font-size: 15px;">
                                        댓글 1
                                    </td>                                    
                                </tr>
                                <tr style="display: inline;">
                                    <td style="width: 50px;">
                                        남궁민                                  
                                    </td>
                                    <td>
                                        2024.01.03                                      
                                    </td>
                                    <td>
                                        <button style="border: none; background-color: white; ">신고</button>                                  
                                    </td>
                                </tr>
                                <tr style="border-bottom: 1px solid gray;">
                                    <td style="color: rgb(110, 107, 107) !important;">
                                        이번 시범경기보니까 다들 폼이 올랐더라구요.                                   
                                    </td>
                                </tr>
                                <tr>
                                    <div style="display: inline;">
                                    	<tr>
	                                        <td style="width: 100%; padding: 20px 0">
	                                            <textarea name="writeArea" id="reveiwWrite" cols="1" rows="2" placeholder="로그인 후 의견을 적어주세요."></textarea>
	                                        </td>
	                                        <td>
	                                            <button> 댓글달기 </button>
	                                        </td>
                                    	</tr>
                                    </div>
                                </tr>
                            </table>
                        </div>

                    </div>

					<!-- 우측메뉴 종료 -->
                </div>
            </div>
     	</form>
      
     	<%@ include file="/layout/footer.jsp" %>
        
        <script>
            //메인 스크롤 이벤트 
            window.sr = ScrollReveal({ reset: true });
            let SRArr = ['.first-title','.slider-con','.section-1-con','.section-2-con','.section-3-con','footer'];
            SRArr.forEach(selector => {
                sr.reveal(selector, { 
                    origin: 'bottom', distance: '100px', duration: 2000,
                    viewFactor: 0.1 // 10%만 보이면 나타나도록 설정
                });
            });
            ScrollReveal().reveal('.headline');
        </script>
	</div>
</body>

</html>