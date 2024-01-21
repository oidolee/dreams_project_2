<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 윤석무 -->
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    
    <title> 회원가입 페이지 </title>
    
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="./resource/css/common/common.css">
    <link rel="stylesheet" href="./resource/css/common/header.css">
    <link rel="stylesheet" href="./resource/css/common/footer.css">
    <link rel="stylesheet" href="./resource/css/index.css">
    <link rel="stylesheet" href="../css/customer/join.css">
    
    

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="./resource/js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- scrollreveal -->
    <script src="https://unpkg.com/scrollreveal/dist/scrollreveal.min.js"></script>
    <!-- header.js -->
    <script src="./resource/js/common/header.js"></script>

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
    
    <script type="text/javascript">
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
	</script>
	
	<style>
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
	</style>
</head>
<div class="wrap">
  
    <body>
    	<jsp:include page="../../layout/header.jsp"></jsp:include> 
      
        <div class="slider-con">
			<div class="slider-box">
				<img src="../image/banner/드림즈_포토샵.jpg" width="100%">
			</div>
		</div>
		
		<!-- 컨텐츠 시작 -->
		<div id="container">
			<div id="contents">

				<div id="content">
					<div class="location">
						<li>Home /&nbsp; </li>		<!-- &nbsp; 띄어쓰기 -->
						<li class="here" style="color: #000  !important;">회원가입</li>
					</div>

				</div>
			</div>
		</div>
		<div id="container">
            <div id="contents" align="center">
                <!-- 상단 중앙1 시작 -->
                <div id="section1" style="padding-top: 30px;">
                    <h3 style="color: #000  !important;"> 회원정보 입력 </h3>
				</div>
				<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 47px; position: relative; padding-bottom: 20px">
					<div style="border-bottom: 2px solid; width: 58%; color: #000 !important;"> </div>
				</div>

                <!-- 상단 중앙2 시작 -->
                <div id="section2">
                    <div id="s2_inner">
                        <div class="join" >
                            <form name="joinform" action="joinAction.jsp" method="post" onsubmit="return inputChk()">   <!-- post : 노출x / get : 노출o -->
								<table>
                                    <tr>
                                        <th>
											<label for="userId" style="color: #ffffff  !important;">아이디</label>
											
										</th>
                                        <td>
                                            <input type="text" class="input" id="userId" name="userid" size="20" placeholder="공백없이 20자이내로 작성" style="width: 225px;" autofocus>    <!-- placeholder : 힌트 -->
											<input type="button" size="20" value="중복확인" style="font-size: 15px;  width: 70px; height: 40px; color: #000 !important; padding-top: 0.5px ">
										</td>
                                    </tr>

                                    <tr>
                                        <th> 
											<label for="userPwd" style="color: #ffffff !important;">비밀번호</label>
										</th>
                                        <td>
                                            <input type="password" class="input" id="userPwd" name="userpwd" size="20" placeholder="영숫자 8자이상" >   
                                        </td>
                                    </tr>

                                    <tr>
										<th>
                                        	<label for="userRePwd" style="color: #ffffff  !important;">비밀번호<br>(확인)</label>
										</th>
                                        <td>
                                            <input type="password" class="input" id="userRePwd" name="userrepwd" size="20" placeholder="비밀번호 확인" >    
                                        </td>
                                    </tr>

                                    <tr>
										<th>
                                        	<label for="userName" style="color: #ffffff  !important;"> 이름 </label>
										</th>
                                        <td>
                                            <input type="text" class="input" id="userName" name="username" size="20" placeholder="이름 작성" >    
                                        </td>
                                    </tr>

                                    <tr>
										<th>
                                        	<label for="brithDay" style="color: #ffffff  !important;"> 생년월일 </label>
										</th>
                                        <td>
                                            <input type="date" class="input" id="brithDay" name="birthday" size="10" placeholder="생년월일 8자리" >   
                                        </td>
                                    </tr>

								
									<tr>
										<th rowspan="3">
											<label for="Hp1" style="color: #ffffff  !important;">  주소</label>
										</th>
										<td style="border-bottom: none; ">
											<input type="text" class="input" id="Post1" name="post1" size="3" style="width: 60px; height: 30px; "  >  
											-
											<input type="text" class="input" name="post2" size="3" style="width: 60px; height: 30px;"  > 
											<input type="button" class="input" name="post3" size="4" style="width: 90px; padding-right: 10px; height: 30px; color: #000000  !important; font-size: 90%;" value="우편번호▶" onclick="location.href='https://www.epost.go.kr/search.RetrieveNewAddressNewZipCdList.comm'" >   
										</td>
									</tr>
									
									<tr>
										<td style="border-bottom: none; padding: 0px 0px 0px 10px; color: #000000  !important; font-size: 90%; ">
											<input type="text" class="input" name="adress1" size="8" style="width: 73%; height: 80%;">&nbsp;기본주소
										</td>
									</tr>
										
									<tr>
										<td style="color: #000000  !important; font-size: 90%;">
											<input type="text" class="input" name="adress2" size="8" style="width: 73%; height: 80%;">&nbsp;나머지주소

										</td>
									</tr>

                                    <tr>
										<th>
                                        	<label for="Hp1" style="color: #ffffff  !important;">  연락처</label>
										 </th>
                                        <td>
                                            <input type="text" class="input" id="Hp1" name="hp1" size="3" style="width: 75px"  >  
                                            -
                                            <input type="text" class="input" name="hp2" size="4" style="width: 95px"  > 
                                            -
                                            <input type="text" class="input" name="hp3" size="4" style="width: 95px"  >   
                                        </td>
                                    </tr>

                                    <tr>
										<th>
                                        	<label for="Email1" style="color: #ffffff  !important;"> 이메일</label> 
										</th>
                                        <td>
                                            <input type="text" class="input" id="Email1" name="email1" maxlength="20" style="width: 70px">    
                                            @
                                            <input type="text" class="input" name="email2" maxlength="20" style="width: 100px" >   
                                            <select class="input" name="email3" style="width: 100px; color: #000 !important;">
                                                <option value="0">직접입력</option>
                                                <option value="naver.com">네이버</option>
                                                <option value="google.com">구글</option>
                                                <option value="daum.met">다음</option>
                                                <option value="nate.com">네이트</option>
                                            </select>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td colspan="2" style="border-bottom: none">
                                            <br>
                                            <div align="right">
                                                <input class="inputButton" type="submit" value="회원가입" style="color: #000  !important;">
                                                <input class="inputButton" type="reset" value="초기화" style="color: #000  !important;">
                                                <input class="inputButton" type="button" value="가입취소" onclick="window.location='../../index.jsp'" style="color: #000  !important;">
                                            </div>
                                        </td>
                                    </tr>
                                </table>
							</form>
						</div>
					</div>
					<div style="display: flex; justify-content: center; align-items: center; margin-bottom: 105px; position: relative;">
						<div style="border-bottom: 1px solid; width: 58%; color: #000 !important;">
						</div>
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
                        <li><a href="../page_2/ticketFee.jsp"><img src="../image/main/dreams_char.png"
                                    alt=""></a></li>
                        <li><a href="https://www.instagram.com/explore/tags/%EC%8A%A4%ED%86%A0%EB%B8%8C%EB%A6%AC%EA%B7%B8/top/"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item2.png"
                                    alt=""></a></li>
                        <li><a href="../page_6/stadium.jsp"><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/index/btn_link_toolbar_item3.png"
                                    alt=""></a></li>
                    </ul>
                </div>
            </div>
        </section>
		
     	<jsp:include page="../../layout/footer.jsp"></jsp:include> 
        
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