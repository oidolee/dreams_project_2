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


</head>

<body class="sb-nav-fixed">
    <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
        <!-- Navbar Brand-->
        <a class="navbar-brand ps-3" href="${path}/resource/admin/index.jsp">드림즈 관리자</a>
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
                    <div class="row mt-4">
                        <div class="col-xl-2 col-md-6">
                        </div>
                   
                    </div>

                   <div class=board-kind style="display: flex;">
                        <div class="board-kind1">
                            <ul class="nav nav-tabs" id="myTab" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link active" id="board" data-bs-toggle="tab" data-bs-target="#board-tab-pane"
                                        type="button" role="tab" aria-controls="board-tab-pane" aria-selected="true">게시판 현황</button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button class="nav-link" id="review" data-bs-toggle="tab" data-bs-target="#review-tab-pane"
                                        type="button" role="tab" aria-controls="review-tab-pane" aria-selected="false">댓글 현황</button>
                                </li>
                            </ul>
                            <div class="tab-content" id="myTabContent">
                                <!-- board -->
                                <div class="tab-pane fade show active" id="board-tab-pane" role="tabpanel" aria-labelledby="board-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-board" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                                <!-- 1fTable -->
                                <div class="tab-pane fade hide" id="review-tab-pane" role="tabpanel" aria-labelledby="review-tab" tabindex="0">
                                    <div class="row">
                                        <!-- // 차트를 그릴 영역으로 canvas태그를 사용한다. -->
                                        <div class="chartCon">
                                            <canvas id="myChart-review" width="900" height="500"></canvas>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-board').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '게시판 현황',
                                    // ⑥dataset값(Array)
                                    data: [5, 10, 8, 6, 5, 7],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '게시글 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <script>
                        //chartJs

                        // 차트를 그럴 영역을 dom요소로 가져온다.
                        var chartArea = document.getElementById('myChart-review').getContext('2d');

                        // 차트를 생성한다. 
                        var myChart = new Chart(chartArea, {
                            // ①차트의 종류(String)
                            type: 'bar',
                            // ②차트의 데이터(Object)
                            data: {
                                // ③x축에 들어갈 이름들(Array)
                                labels: ['2023-08', '2023-09', '2023-10', '2023-11', '2023-12', '2024-01'],
                                // ④실제 차트에 표시할 데이터들(Array), dataset객체들을 담고 있다.
                                datasets: [{
                                    // ⑤dataset의 이름(String)
                                    label: '댓글 현황',
                                    // ⑥dataset값(Array)
                                    data: [30, 45, 25, 53, 42, 63],
                                    // ⑦dataset의 배경색(rgba값을 String으로 표현)
                                    backgroundColor: 'rgba(28, 92, 80, 0.2)',
                                    // backgroundColor: 'rgba(255, 99, 132, 0.2)',
                                    // ⑧dataset의 선 색(rgba값을 String으로 표현)
                                    borderColor: 'rgba(28, 92, 80, 0.2)',
                                    // ⑨dataset의 선 두께(Number)
                                    borderWidth: 1
                                }]
                            },
                            // ⑩차트의 설정(Object)
                            options: {
                                //가로 세로 값 수동 주기위함
                                responsive: false,
                                // ⑪축에 관한 설정(Object)
                                scales: {
                                    x: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '월' // x축 레이블
                                        }
                                    },
                                    y: {
                                        beginAtZero: true,
                                        title: {
                                            display: true,
                                            text: '댓글 수' // y축 레이블
                                        }
                                    }
                                },

                                plugins: {
                                    title: {
                                        display: true,
                                    },
                                }
                            }
                        });


                    </script>

                    <!-- 드림즈 테이블 -->
                    <div style="width: 100%;">
						<h2 align="center" class="title"> 게시판 관리 </h2><br>
	                    
	                <table>
	                    <colgroup>
	                        <col width="50px">
	                        <col width="600px">
	                        <col width="300px">
	                        <col width="100px">
	                        <col width="50px">
	                        <col width="50px">
	                        <col width="50px">
	                        <col width="50px">
	                    </colgroup>
	                    <tbody>
	                    
	                    <c:forEach var="dto" items="${list}">
	                    	<tr class="boardtable">
	                    		<td>${dto.board_No}</td>
	                    		<td class="boardtitle">
	                    			<a href="boardDetail.bc?board_No=${dto.board_No}">${dto.board_Title}</a>
	                    		</td>
	                    		<td class="name">${dto.cust_Id}</td>
	                    		<td class="date">${dto.board_Date}</td>
	                    		<td class="show">${dto.show}</td>
	                    		<td>
	                    			<input type="button" value="보이기" onclick="location.href='admin_board_view.bc?board_No=${dto.board_No}&pageNum=${param.pageNum}'">
	                    		</td>
	                    		<td>
	                    			<input type="button" value="숨기기" onclick="location.href='admin_board_hide.bc?board_No=${dto.board_No}&pageNum=${param.pageNum}'">
	                    		</td>
	                    		<td>
	                    			<input type="button" value="삭제" onclick="location.href='admin_board_delete.bc?board_No=${dto.board_No}&pageNum=${param.pageNum}'">
	                    		</td>
	                    	</tr>
	                    </c:forEach>
	                    </tbody>
	                </table>
	                
	                <hr id="blackline">
	
	                <div class="pageNav">
	                	<!-- 이전 버튼 활성화 -->
	                	<c:if test="${paging.startPage > 10}">
	                    <span class="prev1">
	                        <a href="${path}/admin_board.bc?pageNum=${paging.prev}" style="color: white !important; padding: 5px 5px 5px 5px; margin-right: 10px;">
	                            <span style="color: white !important;">< 이전</span>
	                        </a>
	                    </span>
	                    </c:if>
	                    
	                    <!-- 이전 버튼 활성화 -->
	                    <c:forEach var="num" begin="${paging.startPage}" end="${paging.endPage}">
	                    	<c:if test="${paging.currentPage == num}">
			                    <span class="page">
			                        <a href="${path}/admin_board.bc?pageNum=${num}" class="on" >${num}</a>
			                    </span>
			                </c:if>
	                    	<c:if test="${paging.currentPage != num}">
			                    <span class="page1">
			                        <a href="${path}/admin_board.bc?pageNum=${num}" class="on">${num}</a>
			                    </span>
			                </c:if>
	                    </c:forEach>
	                    
	                    <!-- 다음 버튼 활성화 -->
	                    <c:if test="${paging.endPage < paging.pageCount}">
	                    <span class="next1">
	                        <a href="${path}/admin_board.bc?pageNum=${paging.next}" style="color: white !important; padding: 5px 5px 5px 5px; margin-left: 10px;">
	                            <span style="color: white !important;">다음 ></span>
	                        </a>
	                    </span>
	                    </c:if>
	                </div>
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