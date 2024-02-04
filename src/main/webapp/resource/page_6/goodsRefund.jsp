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
    <title>상품 교환/환불</title>
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
        
        function selectBankChk(){
            
            if(document.refundForm.REF_Account1.value == 0) {  // 직접입력인 경우
               document.refundForm.REF_Account2.value = "";
               document.refundForm.REF_Account2.focus();
               return false;
            }
            else {
               document.refundForm.REF_Account2.value = document.refundForm.REF_Account1.value;
               return false;
            }
        }
        
     	
     	
     	
    </script>
    <style>
        .slider-con img{
            width: 100%;
        }

        .goods {
            text-align: center;
            width: 1280px;
            margin: 0 auto;
        }

        table {
            margin-left: auto;
            margin-right: auto;
            border-spacing: 2px;
            border-collapse: separate;
        }
        
        thead tr th {
            font-weight: bold;
            vertical-align: middle !important;
        }

        tbody tr td {
            vertical-align: middle;
        }

        .form tr label {
            color: #000 !important;
        }
        
        .form {
            border-spacing: 10px;
            border-collapse: separate;
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
 

        <div class="goods">
            <h2 style="color: #000 !important; font-weight: bold;"><br>상품 교환/환불<br><br></h2>
            <fieldset> 
                <legend style="color: #000 !important; font-weight: bold;"> 최근 구매한 상품<hr> </legend>
                <table class="table" align="center">
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
            </fieldset>
            
            <div>
                
                <br>
                <h2 style="color:#000 !important; font-weight: bold;">교환/환불 신청서</h2>
                <br><br>
                <form name="refundForm" method="post" action="goodsRefundSubmit.oc">
                	
                	<input type="hidden" name="REF_cust_Id" value="임시"> <!-- ${sessionId} -->
                	<input type="hidden" name="REF_Prod_No" value="9999">
	                <table class="form">
	                    <tr>
	                        <th align="center"><label for="order_No">주문번호</label></th>
	                        <td align="left">
	                        	<input type="text" id="order_No" name="order_No" size="65" required autofocus>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Name">성명</label></th>
	                        <td align="left">
	                        	<input type="text" id="REF_Name" name="REF_Name" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Phone">연락처</label></th>
	                        <td align="left">
	                        	<input type="text" id="REF_Phone" name="REF_Phone" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Address">주소</label></th>
	                        <td align="left">
	                        	<input type="text" id="REF_Address" name="REF_Address" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Prod_Name">상품명</label></th>
	                        <td align="left">
	                        	<input type="text" id="REF_Prod_Name" name="REF_Prod_Name" size="65" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Prod_qty">개수</label></th>
	                        <td align="left">
	                        	<input type="text" id="REF_Prod_qty" name="REF_Prod_qty" size="3" required>
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Status"> 교환/환불 </label></th>
	                        <td align="left" style="color:black !important">
	                        	<input type="radio" id="REF_Status" name="REF_Status" value="교환"> 교환
	                        	<input type="radio" id="REF_Status" name="REF_Status" value="환불"> 환불
	                        </td>
	                    </tr>
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Reason"> 교환/환불 사유 </label></th>
	                        <td align="left">
	                        	<textarea name="REF_Reason" id="REF_Reason" cols="66" rows="5"></textarea>
	                        </td>
	                    </tr>
	                    
	                    <!-- <tr>
	                        <td align="center"><label for="attachFile"> 파일 첨부 </label></td>
	                        <td align="left"><input type="file"></td>
	                    </tr> -->
	                    
	                    <tr>
	                        <th align="center"><label for="REF_Account"> 환불시 계좌 번호</label></th>
	                        <td align="left">
	                            <select name="REF_Account1" style="width:100px" onchange="selectBankChk()" >
	                                <option value="">은행선택</option>
	                                <option value="국민은행">국민은행</option>
	                                <option value="하나은행">하나은행</option>
	                                <option value="우리은행">우리은행</option>
	                                <option value="카카오뱅크">카카오뱅크</option>
	                                <option value="0">직접입력</option>
	                            </select>
	                            <input type="text" id="REF_Account2" name="REF_Account2" size="15" required>
	                            <input type="text" id="REF_Account3" name="REF_Account3" size="30" required placeholder="-없이 숫자만 입력"> 
	                        </td>		
	                    </tr>
	                    
	                    <tr>
	                        <td colspan="2"><br>
	                            <div align = "center">
	                                <button id=refund_btn class="btn btn-primary" type="submit" style="color: #fff !important;">교환/환불</button>
	                                <a href="${path}/myPage.oc"><button class="btn btn-primary" type="button" style="color: #fff !important;">취소</button></a>
	                            </div>
	                        </td>	
	                    </tr>
	                    
	                </table>
				</form>	
            </div>
        </div>
        <!-- 상단 이동버튼 -->
        <div id="goTop" class="goTop">
            <a href="#header"></a>
        </div>
        <jsp:include page="../../layout/footer.jsp"></jsp:include>
    </body>

</html>