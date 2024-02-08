<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "/layout/setting.jsp" %>  
<!DOCTYPE html>
<html lang="ko">
<!-- 페이지작업자 강승재 -->
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>드림즈 관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="resource/admin/css/styles.css" rel="stylesheet" />
    <link rel="stylesheet" href="${path}/resource/css/common/page4_board.css">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- chartJs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>
    <!-- css -->

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <style>
        .tableContent .displayNone {
            display: none !important;
        }

        .tableContent .pageBox,
        .tableContent .pageCon {
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

    @keyframes floatUpDown {
        from {
            transform: translateY(0);
        }

        to {
            transform: translateY(10px);
        }
    }
    </style>

	<script>
        
    
    $(function() {	// 페이지 로딩시
	 		 	
	 	// 댓글 목록
	 	review_list();
    
    });
    
   
    
    // 자동으로 댓글목록 호출
    function review_list() {
    	var sendData;
    	
    	if("${param.pageNum}" == ""){
    		sendData = 'board_No=${dto.board_No}';
		}
    	else{
			sendData = 'board_No=${dto.board_No}&pageNum=${param.pageNum}';
		}
    	
    	$.ajax({
    		url: '${path}/boardReview.bc',
    		type: 'POST',
   			data: sendData,
    		    		
    		success: function(result){
    			$('#reviewList').html(result);
    		},
    		error: function(){
    			alert('review_list() 오류')
    		}
    	})
    }
    
    </script>

</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="../index.html">드림즈 관리자</a>
        <!-- Sidebar Toggle-->
        <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                class="fas fa-bars"></i></button>
        <!-- Navbar Search-->
        <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            <div class="input-group">
                <input class="form-control" type="text" placeholder="Search for..." aria-label="Search for..."
                    aria-describedby="btnNavbarSearch" />
                <button class="btn btn-primary" id="btnNavbarSearch" type="button"><i
                        class="fas fa-search"></i></button>
            </div>
        </form>
        <!-- Navbar-->
        <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
            <li class="nav-item dropdown">
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                    <li><a class="dropdown-item" href="#!">Settings</a></li>
                    <li><a class="dropdown-item" href="#!">Activity Log</a></li>
                    <li>
                        <hr class="dropdown-divider" />
                    </li>
                    <li><a class="dropdown-item" href="#!">Logout</a></li>
                </ul>
            </li>
        </ul>
    </nav>
    <div id="layoutSidenav">
        <div id="layoutSidenav_nav">
            <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                <div class="sb-sidenav-menu">
                    <div class="nav">
                        <div class="sb-sidenav-menu-heading">HOME</div>
                        <a class="nav-link" href="../index.html">
                            <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                            메인
                        </a>
                        <div class="sb-sidenav-menu-heading">LIST</div>
                        <a class="nav-link collapsed" href="#" data-bs-toggle="collapse"
                            data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                            <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                            관리목록
                            <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                        </a>
                        <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne"
                            data-bs-parent="#sidenavAccordion">
                            <nav class="sb-sidenav-menu-nested nav">
                                <a class="nav-link" href="${path}/admin_member.cc">회원</a>
                                <a class="nav-link" href="../account/acocunt.html">결제</a>
                                <a class="nav-link" href="${path}/admin_board.bc">게시판</a>
                                <a class="nav-link" href="${path}/admin.tc">티켓</a>
                            </nav>
                        </div>

                        
                    </div>
                </div>
                <div class="sb-sidenav-footer">
                    <div class="small">Logged in as:</div>
                    드림즈 관리자
                </div>
            </nav>
            <a href="../../index.html">
                <div class="floating-box"></div>
            </a>
        </div>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">

                    <!-- 드림즈 테이블 -->
                    <div style="width: 100%;">
					<h2 align="center" class="title"> 게시판 세부페이지 </h2><br>
	                    
                    <table id="boardDetail">
                        <tr>
                            <th colspan="3" style="font-size: 25px;">
                                ${dto.board_Title}
                            </th>
                        </tr>
                        
                        <tr>
                            <td style="font-size: 13px; width: 500px;">
                            ${dto.cust_Id}
                            </td>
                       
                            <td style="font-size: 13px; width: 250px;">
                            ${dto.board_Date}
                            </td>
                        </tr>

                        <tr style="height: 200px;">
                            <td colspan="3">
                            <pre>
								${dto.board_Content}
                            </pre>
                            </td>
                           
                        </tr>
                        
                    </table>
	                
	                <hr id="blackline">
                    <div style="display: flex; justify-content: center; margin-bottom: 50px;">
                        <div id="detailbutton">
                        	<input type="hidden" name="hidden_num" value="${dto.board_No}">
                            <a href="boardDetail.bc?board_No=${dto.board_No - 1}" style="margin-right: 250px;"> < 이전 </a>
                            <a href="admin_board.bc"> 목록 </a>
                            <a href="boardDetail.bc?board_No=${dto.board_No + 1}" style="margin-left: 250px;"> 다음 > </a>
                        </div>
                    </div>
					<br><br>
	                
                    <div id="reviewList"></div>
                    
                    
                </div>
                </div>
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; 드림즈 관리자 </div>
                    </div>
                </div>
            </footer>
        </div>
     
    </div>
 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
    <script src="${path}/resource/admin/js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="${path}/resource/admin/assets/demo/chart-area-demo.js"></script>
    <script src="${path}/resource/admin/assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="${path}/resource/admin/js/datatables-simple-demo.js"></script>
    <!-- 드림즈 테이블, chartJs -->
    <script src="${path}/resource/admin/js/admin.js"></script>
</body>

</html>