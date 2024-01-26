<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<link rel="stylesheet" href="/resource/admin/css/product.css">
<link href="resource/css/styles.css" rel="stylesheet" />
<title>드림즈 관리자</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />


<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- chartJs -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
<script>
	function addProduct() {
		window.open('addItem.jsp', "상품추가", "width=1000 , height=600");
	}
</script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9"
	crossorigin="anonymous">

<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>


<script>
	//왼쪽 페이지 이동
	function moveChange(type) {
		console.log(type)
		if (type == 1) {
			window.location.href = "./member/member.html";
		} else if (type == 2) {
			window.location.href = "./account/acocunt.html";
		} else if (type == 3) {
			window.location.href = "./board/board.html";
		} else {
			window.location.href = "./ticket/ticket.html";
		}
	}
</script>
</head>

<body class="sb-nav-fixed">

	<%@ include file="../templet/header.jsp"%>

	<div id="layoutSidenav">
		<div id="layoutSidenav_nav">
			<%@ include file="../templet/nav.jsp"%>
			<a href="../index.html">
				<div class="floating-box"></div>
			</a>
		</div>
		<div id="layoutSidenav_content">
			<main>
				<div class="wrap-table">
					<h2>상품 관리</h2>


					<table border="1" id="productTable">
						<tr>
							<th>상품 번호</th>
							<th>상품 이미지</th>
							<th>상품이름</th>
							<th>가격</th>
							<th>상품 규격</th>
							<th>상품 상세 설명1</th>
							<th>상품 상세 설명2</th>
							<th>반품 및 환불 규정</th>
						</tr>

						<tr>
							<td>1</td>
							<td><img src="../../image/goods/굿즈-마우스패드.png" width="50px"
								height="50px"></td>
							<td>DREAM STOVE 마우스패드</td>
							<td>10000원</td>
							<td><img src="../../image/goods/마우스패드사이즈.jpg" width="50px"
								height="50px"></td>
							<td></td>
							<td></td>
							<td><img src="../../image/goods/배송교환환불.PNG" width="50px"
								height="50px"></td>
						</tr>
					</table>

					<br> <br>
					<div class="button">
						<button id="addProduct" onclick="addProduct()">물품관리</button>
					</div>
				</div>
			</main>
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; 드림즈 관리자</div>
					</div>
				</div>
			</footer>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="../js/datatables-simple-demo.js"></script>
	<!-- 드림즈 테이블, chartJs -->
	<script src="../js/admin.js"></script>
</body>

</html>