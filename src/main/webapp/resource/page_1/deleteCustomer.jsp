<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 윤석무 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>드림즈!!</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="${path}/resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="${path}/resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="${path}/resource/css/common/common.css">
    <link rel="stylesheet" href="${path}/resource/css/common/header.css">
    <link rel="stylesheet" href="${path}/resource/css/common/footer.css">
    <link rel="stylesheet" href="${path}/resource/css/index.css">
    <link rel="stylesheet" href="${path}/resource/css/customer/login.css">

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
    
    <style>
.container-box {
	padding: 0;
}

input:focus {
	outline: none;
}

.slider-con img {
	width: 100%;
}

.center {
	max-width: 1240px;
	margin: 0 auto;
}

.section-1-con {
	height: 440px;
}

.section-1 {
	height: 100%;
	padding: 80px 0;
}

.section-1-top h2 {
	text-align: center;
}

.section-1-top h2 a {
	color: #000 !important;
}

.section-1-bottom ul {
	display: flex;
	justify-content: space-between;
	align-items: center;
	padding-top: 40px;
	padding-left: 0;
}

.location {
	font-size: 14px;
	display: flex;
	justify-content: center;
	padding-left: 850px;
	margin-top: 90px;

}

.here {
	 color: #000  !important;
}

.inputButton {
    width: 120px; /* 너비 조정 */
    height: 40px; /* 높이 조정 */
    margin-right: 2px;
    margin-left: 2px;
    margin-top: -7px;
    background-color: rgb(28 92 80);
    color: #fff !important;
}


</style>

<script type="text/javascript">
	function checkForm() {
		let userId = document.getElementsByName("userid")[0].value;
		let password = document.getElementsByName("password")[0].value;

		if (userId == "") {
			alert("아이디를 입력해주세요");
			return false;
		}
		
		if (password == "") {
			alert("비밀번호를 입력해주세요");
			return false;
		}
	}
</script>
    
    
</head>
<div class="wrap">
    <body>
    	<%@ include file="/layout/header.jsp"%>
      
        <div class="slider-con">
			<div class="slider-box">
				<img src="${path}/resource/image/banner/드림즈_포토샵.jpg">
			</div>
		</div>

		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">
				<div id="content">
					<div class="location">
						<li>Home /&nbsp; </li>		<!-- &nbsp; 띄어쓰기 -->
						<li class="here">LOGIN</li>
					</div>
						<!-- post : 노출x / get : 노출o -->
						<div id="login" class="wideWrap">		<!-- 아랫선 -->
							<div style="display: flex; justify-content: space-between; border-bottom: 2px solid; color: #000 !important; margin-bottom: 47px; position: relative; padding-bottom: 20px">
								<div style="margin-top: -10px; z-index: -1;">
									<img src="${path}/resource/image/logoSmall.png" width="230" height="120">
								</div>

								<div style= "font-size: larger; color: #000 !important; margin-top: 5px; margin-right: 50px; position: absolute; left: 200px; z-index: -1;">
									<h3><b style="color:#1c5c50 !important">회원탈퇴 - 인증화면</b></h3>
									정말 드림즈 회원을 탈퇴하시겠습니까?
									<br> 
									개인정보는 즉시 파기되어 저장되지 않습니다.
								</div>
							</div>
							<form name="loginform" action="deleteCustomerAction.cc" method="post">
								<table style="display: flex; justify-content: center;">
									
									<tr>
                                       <th colspan="2" align="center">
	                                      	<h3>
	                                      		<b style="color: #026b57 !important;">${sessionID}</b>
	                                      		<span style="color:#333 !important">님 비밀번호를 입력하세요!!</span>
	                                      	</h3>
                                       </th>
                                	</tr>

									<tr>
										<td>
											<input type="password" class="input" name="userpwd" title="비밀번호" placeholder="비밀번호" required style="margin-bottom: -5px;">
										</td>
									</tr>
									
									<tr>
                                        <td colspan="2" style="border-bottom: none">
                                            <br>
                                            <div align="center">
                                                <input class="inputButton" type="submit" value="회원탈퇴">
                                                <input class="inputButton" type="reset" value="탈퇴취소" onclick="window.location='index.cc'">
                                            </div>
                                        </td>
                                    </tr>
									
								</table>
							</form>
							<hr id="blackline" style="margin-top: 50px; color: black !important; opacity: 1;">
						</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 끝 -->
		
		<section class="section-1-con">
            <div class="section-1 center">
                <div class="section-1-top">
                    <h2><a href="#">드림즈 바로가기</a></h2>
                </div>
                <div class="section-1-bottom">
                    <ul>
                        <li><a href="${path}/page_2/ticketFee.jsp"><img src="${path}/resource/image/main/dreams_char.png"
                                    alt=""></a></li>
                        <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item2.png"
                                    alt=""></a></li>
                        <li><a href="${path}/page_6/stadium.jsp"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item3.png"
                                    alt=""></a></li>
                    </ul>
                </div>
            </div>
        </section>
     
		<%@ include file="/layout/footer.jsp"%>
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