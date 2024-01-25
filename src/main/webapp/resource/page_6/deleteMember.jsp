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
    <title> 회원 탈퇴</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="/css/common/reset.css">
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
    <script src="${path}/js/bootstrap/bootstrap.bundle.js" defer></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js" ></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- header.js -->
    <script src="${path}/js/common/header.js" defer></script>

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
        
        .delete-member {
            text-align: center;
            width: 1280px;
            margin: auto;
        }
        
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="../../layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="${path}/resource/image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 회원 탈퇴 </h2>
        <br><br><br>
        
        <fieldset class="delete-member" style="padding-left: 0; padding-right: 0;">
            <legend style="color: black !important;"> 굿바이 드림즈 </legend><br><br>
                정말 드림즈 회원을 탈퇴하시겠습니까?<br>
                개인정보는 즉시 파기되어 저장되지 않습니다.<br><br><br>
                <div class="row mb-3">
                    <div class="col-sm-2"></div>
                  <label for="user_id" class="col-sm-2 col-form-label" style="color:black !important">아이디</label>
                  <div class="col-sm-5">
				 	<span style="color:#FF82AA"><b>${sessionID}</b></span>
                  </div>
                </div>
                <div class="row mb-3">
                    <div class="col-sm-2"></div>
                  <label for="user_pwd" class="col-sm-2 col-form-label" style="color:black !important">비밀번호 확인</label>
                  <div class="col-sm-5">
                    <input type="password" class="form-control" name="cust_Password">
                  </div>
                </div>
                <br>
                <button type="submit" class="btn btn-primary" style="color: white !important;"> 회원 탈퇴 </button>
            <a href="./myPage.html"><button class="btn btn-primary" type="button" style="color: #fff !important;">취소</button></a>

        </fieldset>

        <br><br><br>

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>