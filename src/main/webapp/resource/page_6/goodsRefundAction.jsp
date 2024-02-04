<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../../layout/setting.jsp" %>      
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 신재욱 --> 
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title> 회원 정보 수정 </title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/css/common/common.css">
    <link rel="stylesheet" href="${path}/css/common/header.css">
    <link rel="stylesheet" href="${path}/css/common/footer.css">
    <link rel="stylesheet" href="${path}/css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="${path}/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- header.js -->
    <script src="${path}/js/common/header.js"></script>

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
    <!-- fontawesome -->
    <script src="https://kit.fontawesome.com/b0cbfa47b4.js" crossorigin="anonymous"></script>
    <style>
        .slider-con img {
             width: 100%;
        }
        
        .refundAction table{
        	margin-left:auto !important;
        	margin-right:auto !important;
        	text-align:center; 
        	border:1px solid black !important;
        	width:1280px;
        	display:inline-block;
        	color:black !important; 
        }
        

    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="../../layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 교환/환불 신청 완료 </h2>
        <br><br><br>
        
        <div class="refundAction">
	        <table>
				<tr>
					<th style="width: 200px"> 글번호 </th>
					<td style="width: 200px; text-align:center">dfdasda  </td>
					
					<th style="width: 200px"> 조회수 </th>
					<td style="width: 200px; text-align:center">  </td>
				</tr>
				
				<tr>
					<th style="width: 200px"> 작성자 </th>
					<td style="width: 200px; text-align:center"> </td>
					
					<th style="width: 200px"> 비밀번호 </th>
					<td style="width: 200px; text-align:center"> 
					</td> 
				</tr>
				
				<tr>
					<th style="width: 200px"> 글제목 </th>
					<td colspan="3" style="text-align:center">  </td>
				</tr>
				
				<tr>										
					<th style="width: 200px"> 글내용 </th>
					<td colspan="3" style="text-align:center">  </td>
				</tr>
				
				<tr>
					<th style="width: 200px"> 작성일 </th>
					<td colspan="3" style="text-align:center">  </td>
				</tr>
				
			</table>
		</div>
        
        
        
    
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>