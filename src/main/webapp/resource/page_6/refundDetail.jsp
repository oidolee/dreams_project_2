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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <%-- <link href="${path}/css/bootstrap/bootstrap.css" rel="stylesheet" /> --%>
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
        .container-box {
            padding: 0;
        }

        .slider-con img {
             width: 100%;
        }
        
        .refund-goods {
            width: 1280px;
            text-align: center;
            margin: auto;
        }

        .refund-goods label, input {
            color: black !important;
        }
        
        table tr, th {
        	margin: 0 auto;
        	padding-right: 50px;
        	padding
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

        <br><br><br><br><br><br>
        <h2 style="text-align: center; color: black !important; font-weight: bold;" > 교환/환불 신청서 조회 </h2>
        <br><br><br>
        
		
		<c:forEach var="list" items="list">
		
	        <form class=refund-goods>
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_No" class="col-sm-2 col-form-label"> 환불번호 </label>
	              <div class="col-sm-5">
	                <table style="color:black !important">
	                	<tr>
	                		<td style="color:black !important"> </td>
	                	</tr>
	                </table>
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="order_No" class="col-sm-2 col-form-label"> 주문번호 </label>
	              <div class="col-sm-5">
	                <table style="color:black !important">
	                	<tr>
	                		<td style="color:black !important"> 환불 번호 1231</td>
	                	</tr>
	                </table>
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Name" class="col-sm-2 col-form-label"> 이름 </label>
	              <div class="col-sm-5">
	              	<table style="color:black !important">
	                	<tr>
	                		<td style="color:black !important"> 이름 ㅇㄹㄴㅇ</td>
	                	</tr>
	                </table>
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Phone" class="col-sm-2 col-form-label"> 연락처 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Phone" >
	              </div>
	            </div>
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Address" class="col-sm-2 col-form-label"> 주소 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Address" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Prod_No" class="col-sm-2 col-form-label"> 상품번호 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Prod_No" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="user_pwd" class="col-sm-2 col-form-label"> 주문번호 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="order_No" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Prod_Name" class="col-sm-2 col-form-label"> 상품명 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Prod_Name" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Prod_qty" class="col-sm-2 col-form-label"> 환불/교환 개수 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Prod_qty" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Reason" class="col-sm-2 col-form-label"> 환불/교환 사유 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Reason" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Account" class="col-sm-2 col-form-label"> 환불 받을 계좌번호 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Account" >
	              </div>
	            </div>
	            
	            <div class="row mb-3">
	                <div class="col-sm-2"></div>
	              <label for="REF_Date" class="col-sm-2 col-form-label"> 환불/교환 신청일 </label>
	              <div class="col-sm-5">
	                <input type="text" class="form-control" id="REF_Date" >
	              </div>
	            </div>
	            <a href="${path}/myPage.oc"><button type="button" class="btn btn-primary" style="color: white !important;"> 마이페이지 </button></a>
	        </form>
        </c:forEach>
        <br><br><br>
        
    
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>