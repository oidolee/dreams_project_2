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
    <title>내 주문 내역</title>
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
    <style>
        .container-box {
            padding: 0;
        }

        input:focus {
            outline: none;
        }



        .slider-con img{
            width: 100%;
        }

        .center{max-width: 1240px; margin: 0 auto;}
        .section-1-con{height: 440px;}
        .section-1{height: 100%; padding: 80px 0;}
        .section-1-top h2{text-align: center; }
        .section-1-top h2 a{color: #000 !important;}
        .section-1-bottom ul{display: flex; justify-content: space-between;  align-items: center; padding-top: 40px; padding-left: 0;}

        .seat-refund {
            text-align: center;
        }

        table {
            text-align: center;
        }

        table {
            margin: 0 auto;
        }

        .mypage {
            text-align: center;
        }

        .table {
            vertical-align: middles;
        }

        .mypage-button {
            padding: 50px;
            
        }

        .mypage {
            width: 1280px;
            margin: 0 auto;
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

        <!-- 내 주문 내역 시작 -->
        <div class="mypage">
            <h2 style="color: #000 !important; font-weight: bold;"> <br>내 주문 내역<br><br> </h2>
            <a href="./myPage.html"><button class="btn btn-primary" type="button" style="color: #fff !important;">마이페이지</button></a><br><br>
            <h4 style="color: #000 !important; font-weight: bold;"> <br>최근 구매한 티켓 <br><br></h4>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">선택</th>
                        <th scope="col">주문번호</th>
                        <th scope="col">경기 일자</th>
                        <th scope="col">좌석</th>
                        <th scope="col">구분</th>
                        <th scope="col">수량</th>
                        <th scope="col">가격</th>
                        <th scope="col">구매일자</th>
                        <th scope="col">배송</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider">
                      <tr>
                        <td><label><input type="checkbox" name="seats" value="low"> </label></td>
                        <td>20240107T001</td>
                        <td>2024년 4월 3일</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot12.png">외야지정석</td>
                        <td>일반</td>
                        <td>3개</td>
                        <td>39,000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송완료</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="seats" value="low"> </label></td>
                        <td>20240107T002</td>
                        <td>2024년 4월 3일</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot01.png">R.d club(로얄다이아몬드클럽)</td>
                        <td>일반</td>
                        <td>2개</td>
                        <td>170,000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송완료</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="seats" value="low"> </label></td>
                        <td>20240107T003</td>
                        <td>2024년 4월 3일</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot03.png">1층 테이블석</td>
                        <td>일반</td>
                        <td>2개</td>
                        <td>150,000원</td>
                        <td>2024년 1월 7일</td>
                        <td>결제완료</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="seats" value="low"> </label></td>
                        <td>20240107T004</td>
                        <td>2024년 4월 3일</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot04.png">2층 테이블석</td>
                        <td>일반</td>
                        <td>3개</td>
                        <td>150,000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송중</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="seats" value="low"> </label></td>
                        <td>20240107T005</td>
                        <td>2024년 4월 3일</td>
                        <td><img src="https://www.heroesbaseball.co.kr/html/front/web_2018/images/ticket/icoDot05.png">내야커플석</td>
                        <td>일반</td>
                        <td>2개</td>
                        <td>90,000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송중</td>
                      </tr>
                      
                    </tbody>
                </table><br>

            <a class="btn btn-primary" href="./seatRefund.html" role="button" style="color: aliceblue !important; ">티켓 환불</a><br><br>

            <h4 style="color: #000 !important; font-weight: bold;"> <br> 최근 구매한 상품 <br><br></h4>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">선택</th>
                        <th scope="col">주문번호</th>
                        <th scope="col">사진</th>
                        <th scope="col">상품명</th>
                        <th scope="col">수량</th>
                        <th scope="col">가격</th>
                        <th scope="col">구매일자</th>
                        <th scope="col">배송</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider">
                      <tr>
                        <td><label><input type="checkbox" name="goods" value="ball1"> </label></td>
                        <td>20240107A001</td>
                        <td><img src="https://qi-o.qoo10cdn.com/goods_image/5/2/8/4/10818135284s.png" width="150px" height="150px"></td>
                        <td>로고볼(소)</td>
                        <td>1개</td>
                        <td>5000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송완료</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="goods" value="ball2"> </label></td>
                        <td>20240107A002</td>
                        <td><img src="https://qi-o.qoo10cdn.com/goods_image/5/2/8/4/10818135284s.png" width="150px" height="150px"></td>
                        <td>로고볼(소)</td>
                        <td>1개</td>
                        <td>5000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송완료</td>
                      </tr>
                      <tr>
                        <td><label><input type="checkbox" name="goods" value="ball3"> </label></td>
                        <td>20240107A003</td>
                        <td><img src="https://qi-o.qoo10cdn.com/goods_image/5/2/8/4/10818135284s.png" width="150px" height="150px"></td>
                        <td>로고볼(소)</td>
                        <td>1개</td>
                        <td>5000원</td>
                        <td>2024년 1월 7일</td>
                        <td>배송완료</td>
                      </tr>
                    </tbody>
                </table>

                <div class="mypage-button">
                    <button class="btn btn-primary" type="button" style="color: #fff !important;">구매확정</button>
                    <a href="goodsRefund.html"><button class="btn btn-primary" type="button" style="color: #fff !important;">교환/환불</button></a>
                </div>    

        </div>

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>