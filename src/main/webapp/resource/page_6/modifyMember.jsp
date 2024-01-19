<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지 작업자 : 공용 --> 
<head>    
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />

    <title> 회원 정보 수정 </title>
    <!-- reset.css -->
    <link rel="stylesheet" href="../css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="../css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="../css/common/common.css">
    <link rel="stylesheet" href="../css/common/header.css">
    <link rel="stylesheet" href="../css/common/footer.css">
    <link rel="stylesheet" href="../css/index.css">

    <!-- jQuery -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
    <!-- Bootstrap js -->
    <script src="../js/bootstrap/bootstrap.bundle.js"></script>
    <!-- swiper js-->
    <script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-element-bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.min.js" integrity="sha384-Rx+T1VzGupg4BHQYs2gCW9It+akI2MM/mndMCy36UVfodzcJcF0GGLxZIzObiEfa" crossorigin="anonymous"></script>
    <!-- header.js -->
    <script src="../js/common/header.js"></script>

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
        .container-box {
            padding: 0;
        }

        .slider-con img {
             width: 100%;
        }
        
        .modify-member {
            width: 1280px;
            text-align: center;
            margin: auto;
        }

        .modify-member label, input {
            color: black !important;
        }
    </style>
</head>

<body>
    	<!-- 상단 이동 헤더 -->
        <jsp:include page="../../layout/header.jsp"></jsp:include>
 
        <div id="slider_con" class="slider-con">
            <img src="../image/banner/category_DREAMS.jpg">
        </div>
        <br>

        <br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 회원 정보수정 </h2>
        <br><br><br>
        
        <form class="modify-member">
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_id" class="col-sm-2 col-form-label">아이디</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" id="user_id" placeholder="dreamsfan0111" disabled>
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_pwd" class="col-sm-2 col-form-label">비밀번호</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="user_pwd" placeholder="********">
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_pwd_re" class="col-sm-2 col-form-label">비밀번호 확인</label>
              <div class="col-sm-5">
                <input type="password" class="form-control" id="user_pwd_re" placeholder="*********">
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_birth" class="col-sm-2 col-form-label">생년월일</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" id="user_birth" placeholder="19900111">
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_hp" class="col-sm-2 col-form-label">연락처</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" id="user_hp" placeholder="010-1111-2222">
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_address" class="col-sm-2 col-form-label">주소</label>
              <div class="col-sm-5">
                <input type="text" class="form-control" id="user_address" placeholder="서울시 마포구 신수동 케이터틀 3층">
              </div>
            </div>
            <div class="row mb-3">
                <div class="col-sm-2"></div>
              <label for="user_email" class="col-sm-2 col-form-label">이메일</label>
              <div class="col-sm-5">
                <input type="email" class="form-control" id="user_email" placeholder="ict02@naver.com">
              </div>
            </div>
            <br><br>
            <button type="submit" class="btn btn-primary" style="color: white !important;" >회원 정보 수정</button>
            <a href="./myPage.html"><button class="btn btn-primary" type="button" style="color: #fff !important;">취소</button></a>
        </form>
          <br><br><br>
        
    
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>