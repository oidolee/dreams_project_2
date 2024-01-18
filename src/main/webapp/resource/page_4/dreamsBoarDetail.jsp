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
    <title>드림즈게시판 상세</title>
    <!-- reset.css -->
    <link rel="stylesheet" href="./resource/css/common/reset.css">
    <!-- Bootstrap css-->
    <link href="./resource/css/bootstrap/bootstrap.css" rel="stylesheet" />
    <!-- swiper css-->
    <link rel="stylesheet" href="./resource/css/common/common.css">
    <link rel="stylesheet" href="./resource/css/common/header.css">
    <link rel="stylesheet" href="./resource/css/common/footer.css">
    <link rel="stylesheet" href="./resource/css/index.css">
    <link rel="stylesheet" href="../css/common/page4_board.css">

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
</head>
<div class="wrap">
  
    <body>
    	<jsp:include page="../../layout/header.jsp"></jsp:include> 
      
        <div class="slider-con">
            <div class="slider-box">
                <img src="../image/banner/category_BOARDS.jpg" alt="">
            </div>
        </div>
        <!-- 상단 중앙1 시작 -->
				<div style="display: flex; justify-content: center;"class="board">
					
                    <!-- 좌측메뉴 시작 -->
					<jsp:include page="boardLeftMenu.jsp"></jsp:include> 
					<!-- 좌측메뉴 종료 -->	
				<!-- 우측메뉴 시작 -->
                <div style="width: 800px; " >
					<h2 align="center" class="title"> 드림즈 게시판 </h2><br>
                    <table id="boardDetail">
                        <tr>
                            <th style="font-size: 25px;">
                                우승을 위하여
                            </th>
                                                        
                        </tr>
                        <tr>
                            <td style="font-size: 13px;">
                            박은빈 (parkeun**)
                            </td>

                            <td style="font-size: 13px;">
                            2024.01.03
                            </td>

                            <td style="font-size: 13px;">
                            <button type="button" style="background-color: white; border-color: white;">신고</button>
                            </td>
                        </tr>

                        <tr style="height: 200px;">
                            <th>
                                올해는 우승 할 수 있을까요?<br>
                                부디 꼭 우승을 했으면 좋겠습니다.<br>
                                그나저나 새로운 영입 소식은 없나요?<br>
                                
                            </th>
                           
                        </tr>
                        
                    </table>
                
                    <hr id="blackline">
                    <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                        <div id="writebutton">
                            <button style="margin-right: 300px; width: 60px;"> < 이전 </button>                        
                            <a href="dreamsBoard.html"><button style="width: 50px;"> 목록 </button></a>
                            <button style="margin-left: 300px; width: 60px;"> 다음 > </button>   
                        </div>
                    </div>
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
                                        <td style="width: 100%; padding: 20px 0">
                                            <textarea name="writeArea" id="reveiwWrite" cols="1" rows="2" placeholder="로그인 후 의견을 적어주세요."></textarea>
                                        </td>
                                        <td>
                                            <button> 댓글달기 </button>
                                        </td>
                                    </div>
                                </tr>
                            </table>
                        </div>

                    </div>



					<!-- 우측메뉴 종료 -->
                </div>
            </div>
     
      
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