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
    <title>내 주문 내역</title>
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
    <style>
        .slider-con img{
            width: 100%;
        }

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
        
        thead tr th {
        	color: black !important;
        }
        
        tbody tr td {
        	color: black !important;
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

        <!-- 내 주문 내역 시작 -->
        <div class="mypage">
            <h2 style="color: #000 !important; font-weight: bold;"> <br>내 주문 내역<br><br> </h2>
            
            <a href="${path}/myPage.oc"><button class="btn btn-primary" type="button" style="color: #fff !important;">마이페이지</button></a><br><br>
            
            
            <h4 style="color: #000 !important; font-weight: bold;"> <br> 최근 구매한 상품 <br><br></h4>
                <table class="table">
                    <thead>
                      <tr>
                        <th scope="col">선택</th>
                        <th scope="col">주문번호</th>
                        <th scope="col">사진</th>
                        <th scope="col">주문 내역</th>
                        <th scope="col">결제 금액</th>
                        <th scope="col">구매일</th>
                        <th scope="col">상태</th>
                      </tr>
                    </thead>
                    <tbody class="table-group-divider" style="vertical-align: middle !important">
                    <c:forEach var="list" items="${ list }">
                      <tr>
                        <td><label><input type="radio" name="goods"> </label></td>
                        <td>${list.order_No}</td>
                        <td><img src="https://qi-o.qoo10cdn.com/goods_image/5/2/8/4/10818135284s.png" width="150px" height="150px"></td>
                        <td>${list.order_Content}</td>
                        <td>${list.order_Amount} 원</td>
                        <td>${list.order_Date}</td>
                        <td>${list.order_Status}</td>
                      </tr>
                    </c:forEach>  
                    </tbody>
                </table>

                <div class="mypage-button">
                    <button class="btn btn-primary" type="button" style="color: #fff !important;">구매확정</button>
                    <a href="${path}/goodsRefund.oc"><button class="btn btn-primary" type="button" style="color: #fff !important;">교환/환불</button></a>
                </div>    

        </div>

        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>