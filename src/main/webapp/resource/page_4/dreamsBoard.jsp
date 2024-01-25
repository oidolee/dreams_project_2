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
    <title>드림즈게시판</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resource/css/common/reset.css">
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
	<script src="${path}/resource/page_4/dreamsBoard.js"></script>
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
<div class="wrap">
  
    <body>
    	<%@ include file="/layout/header.jsp" %>
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="${path}/resource/image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
			<form name="boardForm" method="post">
				<div style="display: flex; justify-content: center;"class="board">
                    <!-- 좌측메뉴 시작 -->
					<%@ include file="/resource/page_4/boardLeftMenu.jsp" %>
					<!-- 좌측메뉴 종료 -->	
					<!-- 우측메뉴 시작 -->
	                <div style="width: 800px;">
						<h2 align="center" class="title"> 드림즈 게시판 </h2><br>
	                    
	                <table>
	                    <colgroup>
	                        <col width="100px">
	                        <col width="600px">
	                        <col width="300px">
	                        <col width="100px">
	                    </colgroup>
	                    <tbody>
	                    	<tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">드림즈 화이팅!!</a>
	                    		</td>
	                    		<td class="name">
	                    			"남궁민 (namgung**)"
	                    		</td>
	                    		<td class="date">2024.01.03</td>
	                    	</tr>
	                    	<tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="dreamsBoarDetail.bc">우승을 위하여</a>
	                    		</td>
	                    		<td class="name">
	                    			"박은빈 (parkeun**)"
	                    		</td>
	                    		<td class="date">2024.01.02</td>
	                    	</tr>
	                    	<tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">임동규를 방출하라</a>
	                    		</td>
	                    		<td class="name">
	                    			"김철수 (kimch**)"
	                    		</td>
	                    		<td class="date">2024.01.02</td>
	                    	</tr>
	                    	<tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">야구장이 멀어요</a>
	                    		</td>
	                    		<td class="name">
	                    			"이서울 (seoul**)"
	                    		</td>
	                    		<td class="date">2024.01.01</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">근데 야구장 가본사람 있어요?</a>
	                    		</td>
	                    		<td class="name">
	                    			"박찬혁 (park**)"
	                    		</td>
	                    		<td class="date">2023.12.31</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">우승은 언제쯤 할까요?</a>
	                    		</td>
	                    		<td class="name">
	                    			"주시은 (jusi**)"
	                    		</td>
	                    		<td class="date">2023.12.31</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">내 욕한 사람들 다 기억한다</a>
	                    		</td>
	                    		<td class="name">
	                    			"임동규 (limdo**)"
	                    		</td>
	                    		<td class="date">2023.12.31</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">연말 잘보내세요</a>
	                    		</td>
	                    		<td class="name">
	                    			"차태현 (cha**)"
	                    		</td>
	                    		<td class="date">2023.12.30</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">야구장에 소주 갖고오는 사람 뭐냐</a>
	                    		</td>
	                    		<td class="name">
	                    			"조인성 (cho**)"
	                    		</td>
	                    		<td class="date">2023.12.28</td>
	                    	</tr>
	                        <tr class="boardtable">
	                    		<td> 
	                    		</td>
	                    		<td class="boardtitle">
	                    			<a href="">메리크리스마스</a>
	                    		</td>
	                    		<td class="name">
	                    			"한효주 (han**)"
	                    		</td>
	                    		<td class="date">2023.12.25</td>
	                    	</tr>
	                    </tbody>
	                </table>
	                
	                <hr id="blackline">
	                <div style="display: flex; justify-content: right;">
	                    <input type="text" class="search" name="search" style="height: 30px;">
	                    <input type="button" name="searchButton" id="search" value="Search" onclick="searchBoard()">
	                    <a href="dreamsBoardWrite.bc"><button type="button" id="write" >드림즈 게시판 글쓰기</button></a>
	                </div>
	
	                <div class="pageNav">
	                    <span class="prev1">
	                        <a href="" style="color: white !important; padding: 5px 5px 5px 5px; margin-right: 10px;">
	                            <span style="color: white !important;">< 이전</span>
	                        </a>
	                    </span>
	                    <span class="page">
	                        <a href="" class="on">1</a>
	                        <a href="" >2</a>
	                        <a href="" >3</a>
	                        <a href="" >4</a>
	                    </span>
	                   <span class="next1">
	                        <a href="" style="color: white !important; padding: 5px 5px 5px 5px; margin-left: 10px;">
	                            <span style="color: white !important;">다음 ></span>
	                        </a>
	                    </span>
	                </div>
                </div>
            </div>
          </form>
		<!-- 우측메뉴 종료 -->
     
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
    </body>
</div>

</html>