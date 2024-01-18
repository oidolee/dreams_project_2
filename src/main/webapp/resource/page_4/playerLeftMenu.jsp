<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 강승재 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>player좌측메뉴</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="/dreams_project_2/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/common.css">
    <link rel="stylesheet" href="/dreams_project_2/resource/css/common/header.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="/dreams_project_2/resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- header.js -->
    <script src="/dreams_project_2/resource/js/common/header.js"></script>
</head>
<body>
	<div id="left">
       	<div class="left_inside" >
                        <!-- 좌측메뉴바 시작 -->
			<ul class="left_menubar">
                <li><h3 style="color: white !important;">Players</h3></li>
				<li>
                    <ul class="product_menu">
						<p></p>
						<li><a href="players.jsp">선수</a></li>
						<li><a href="coaching.jsp">코칭스태프</a></li>
						<li><a href="steff.jsp">구단관계자</a></li>
					</ul>
				</li>	
			</ul>	
			<!-- 좌측메뉴바 종료 -->
		</div>
	</div>
</body>
</html>