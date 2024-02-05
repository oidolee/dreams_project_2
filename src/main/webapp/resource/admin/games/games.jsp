<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>드림즈 관리자</title>
<link
	href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css"
	rel="stylesheet" />
<link href="${path}/resource/admin/css/styles.css" rel="stylesheet" />
<script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js"
	crossorigin="anonymous"></script>
<!-- chartJs -->
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

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
<style>
.tableContent .displayNone {
	display: none !important;
}

.tableContent .pageBox, .tableContent .pageCon {
	display: flex;
}

.chartCon {
	display: flex;
	justify-content: center;
	overflow-x: auto;
}

.floating-box {
	width: 50px;
	height: 50px;
	background: url("../../image/logoSmall.png") no-repeat 50% 50%;
	background-size: 110px;
	position: fixed;
	bottom: 10px;
	left: 250px;
	border-radius: 5px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #fff;
	font-weight: bold;
	cursor: pointer;
	animation: floatUpDown 1s infinite alternate;
	transition: transform 0.3s;
	z-index: 10000;
}

.floating-box:hover {
	transform: translateY(-5px);
}

.floating-box::before {
	content: "드림즈 메인";
	white-space: pre-line;
	position: absolute;
	width: 58px;
	text-align: center;
	top: -50px;
	left: 50%;
	transform: translateX(-50%);
	background-color: #1c5c50;
	color: #fff;
	padding: 5px;
	border-radius: 3px;
	font-size: 12px;
	opacity: 0;
	transition: opacity 1s ease-in-out;
}

.floating-box:hover::before {
	opacity: 1;
}

@
keyframes floatUpDown {from { transform:translateY(0);
	
}

to {
	transform: translateY(10px);
}
}
</style>

<script>
        //왼쪽 페이지 이동
        function moveChange(type){
            console.log(type)
            if(type == 1){
                window.location.href = "./member/member.html";
            }else if(type == 2){
                window.location.href = "./account/acocunt.html";
            }else if(type == 3){
                window.location.href = "./board/board.html";
            }else {
                window.location.href = "./ticket/ticket.html";
            }
        }
        //select form 조건
        $(function(){
            $("#gamesInsertButton").on("click",function(){
                if($("#DG_Home").val() == ""){
                    alert("홈팀을 선택해주세요");
                    $("#DG_Home").focus();
                    return false;
                }
                if($("#DG_Away").val() == ""){
                    alert("원정팀을 선택해주세요");
                    $("#DG_Away").focus();
                    return false;
                }

                if($("#DG_Home").val() == $("#DG_Away").val()){
                    alert("원정팀 선택을 확인해 주세요!");
                    $("#DG_Away option").eq(0).prop("selected", true); 
                    $("#DG_Away").focus();
                    return false;
                }

                if($("#DG_Time").val() == ""){
                    alert("시간을 선택해주세요");
                    $("#DG_Time").focus();
                    return false;
                }
                $("#gamesInsertForm").submit();
            })
        })
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
				<div class="container-fluid px-4">
					<div class="row mt-4">
						<div class="col-xl-2 col-md-6">
							<div class="card bg-primary text-white mb-4">
								<div class="card-body">경기일정 등록</div>
								<div
									class="card-footer d-flex align-items-center justify-content-between">
									<a class="small text-white stretched-link"
										href="${path}/games.gc">게임일정 상세내역</a>
									<div class="small text-white">
										<i class="fas fa-angle-right"></i>
									</div>
								</div>
							</div>
						</div>

					</div>

					<!-- chart 부분 -->
					<div class="row">
						<section class="mt-5">
							<div class="container card" style="max-width: 600px;">
								<div class="row d-flex justify-content-center">
									<div class="col-md-6 text-center"
										style="display: flex; flex-direction: column; height: 400px; justify-content: center; align-items: center;">
										<h2>경기일정 등록</h2>

										<form action="${path}/gamesInsertAction.gc" class="mt-5" id="gamesInsertForm"
											name="gamesInsertForm">
											<div class="row mb-3 text-start">
												<label for="colFormLabelSm"
													class="text-left col-sm-4 col-form-label col-form-label-sm ">Home</label>
												<div class="col-sm-8">
													<select id="DG_Home" name="DG_Home" class="form-select"
														aria-label="Default select example">
														<option value="">팀 선택</option>
														<c:forEach var="dto" items="${list}">
															<option value="${dto.getDK_TeamName()}"><c:out
																	value="${dto.getDK_TeamName()}" /></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="row mb-3 text-start">
												<label for="colFormLabelSm"
													class="text-left col-sm-4 col-form-label col-form-label-sm">away</label>
												<div class="col-sm-8">
													<select id="DG_Away" name="DG_Away" class="form-select"
														aria-label="Default select example">
														<option value="">팀 선택</option>
														<c:forEach var="dto" items="${list}">
															<option value="${dto.getDK_TeamName()}"><c:out
																	value="${dto.getDK_TeamName()}" /></option>
														</c:forEach>
													</select>
												</div>
											</div>
											<div class="row mb-3 text-start">
												<label for="DG_Time"
													class="text-left col-sm-4 col-form-label col-form-label-sm">시간</label>
												<div class="col-sm-8">
													<input type="datetime-local" id="DG_Time" name="DG_Time"
														required class="form-control form-control-sm">
												</div>
											</div>
											<button type="button" id="gamesInsertButton"
												class="btn btn-success mt-3">등록</button>
										</form>


									</div>
								</div>
							</div>
						</section>
					</div>

				</div>
			</main>
			<%@ include file="../templet/footer.jsp"%>
		</div>
	</div>





	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resource/admin/js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="assets/demo/chart-area-demo.js"></script>
	<script src="assets/demo/chart-bar-demo.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
		crossorigin="anonymous"></script>
	<script src="${path}/resource/admin/js/datatables-simple-demo.js"></script>
	<!-- 드림즈 테이블, chartJs -->
	<script src="${path}/resource/admin/js/admin.js"></script>
</body>

</html>