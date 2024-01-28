<%@page import="pj.mvc.jsp.dto.TicketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>드림즈 관리자</title>
    <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
    <link href="resource/admin/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <!-- chartJs -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script>
let member = {};
    
    <%
				
    			List<TicketDTO> list = (List<TicketDTO>)request.getAttribute("list");	
    			for(TicketDTO tdto : list){
    %>
    				member['<%= tdto.getTicket_seat() %>'] = {
    					'bgNormalPrice' : '<%= tdto.getTicket_grade_normal() %>',	
    					'bgMPrice' : '<%= tdto.getTicket_grade_membership() %>',	
    					'bgCPrice' : '<%= tdto.getTicket_grade_child() %>',	
    				}
    <%				
    			}
    %>
    function calculator(){
        let parkseat =  document.getElementById("parkseat").value; // 좌석 등급
//      let bgNormalPrice = document.getElementById("bgNormalPrice").value; // 일반등급 좌석
        let bgNormalPrice = member[parkseat]['bgNormalPrice']; // 일반등급 좌석
        let bgMPrice = member[parkseat]['bgMPrice'];	// 멤버쉽 등급 가격
        let bgCPrice = member[parkseat]['bgCPrice']; 	// 어린이 등급 가격
        
        /* let bgNCnt = parseInt(document.getElementById("bgnCnt").value);
        let bgMCnt = parseInt(document.getElementById("bgmCnt").value);
        let bgCCnt = parseInt(document.getElementById("bgcCnt").value);
        let discount = 0; // 할인율 */
		

        document.getElementById('bgNormalPrice').textContent = bgNormalPrice.toLocaleString() + '원';
        document.getElementById('bgMPrice').textContent = bgMPrice.toLocaleString() + '원';
        document.getElementById('bgCPrice').textContent = bgCPrice.toLocaleString() + '원';
    };
    </script>
     <script>
        function priceSelect(){
            calculator()
            // let getIdx = $("#parkseat").val();
            // let priceArr = [
            //     [100,200,300],
            //     [400,500,600],
            //     [100,200,300]
            // ]

            // let normalPrice = priceArr[getIdx][0];
            // $("#bgNormalPrice").html(priceArr[1][1])
            // // priceArr[1][1]
        } 
    </script>
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
                window.location.href = "./ticket/ticket.jsp";
            }
        }
        $(function(){
        	$('#btnEdit').click(function(){
    			
    			alert('수정페이지');
    			document.ticket_ChangeForm.action="${path}/ticket_update.tc"; 
    			document.ticket_ChangeForm.submit();
    			
    		});
    		$('#btnInsert').click(function(){
    			
    			alert('추가페이지');
    			document.ticket_ChangeForm.action="${path}/insertTicket.tc"; 
    			document.ticket_ChangeForm.submit();
    			
    		});
        });
		
    </script>
</head>
<body class="sb-nav-fixed">

	<%@ include file="/resource/admin/templet/header.jsp" %>
	<div id="layoutSidenav">
        <div id="layoutSidenav_nav">
        	<%@ include file="/resource/admin/templet/nav.jsp" %>
            <a href="../index.html">
                <div class="floating-box"></div>
            </a>
        </div>
        <div id="layoutSidenav_content">
            <main>
             	<div class="purchase">
				        <div class="elements">
				            <h3>가격</h3>
				            <form name = "ticket_ChangeForm" method="post">
							<table border="1" style="width: 416.55px;">
								<tr>
									<td colspan="4">
										<strong>좌석</strong>
										<select id="parkseat" name="parkseat" onchange="priceSelect()">
						                    <option value="#">좌석을 선택해 주세요.</option>
										<% 
											/* List<TicketDTO> list = (List<TicketDTO>)request.getAttribute("list"); */	
											for(TicketDTO tdto : list){
										%>
											<!-- html -->
											 <option value="<%= tdto.getTicket_seat() %>"><%= tdto.getTicket_seat() %></option> 
										<%		
												
											}
										
										%>
						                    <!-- <option value="R.d club">R.d club</option>
						                    <option value="1층 테이블석">1층 테이블석</option>
						                    <option value="2층 테이블석">2층 테이블석</option>
						                    <option value="내야커플석">내야커플석</option>
						                    <option value="외야커플석">외야커플석</option>
						                    <option value="다크버건디석">다크버건디석</option>
						                    <option value="버건디석">버건디석</option>
						                    <option value="3층 지정석">3층 지정석</option>
						                    <option value="4층 지정석">4층 지정석</option>
						                    <option value="휠체어석">휠체어석</option>
						                    <option value="외야 지정석">외야 지정석</option>
						                    <option value="외야 패밀리석 4인">외야 패밀리석 4인</option>
						                    <option value="외야 패밀리석 5인">외야 패밀리석 5인</option>
						                    <option value="외야 유아동반석 2인">외야 유아동반석 2인</option> -->
					                	</select>
									</td>
	             				 </tr>
                        
                            
                            
	                            <tr id="normal-price">
	                                <td style="background: whitesmoke;">기본가</td>
	                                <td>일반</td>
	                                <td id="bgNormalPrice">0</td>
	                            </tr>
	                            <tr>
	                                <td rowspan="2" style="background: whitesmoke;">기본할인</td>
	                                <td>멤버쉽</td>
	                                <td id="bgMPrice">0</td>
	                            </tr>
	                            <tr>
	                                <td>듬린이</td>
	                                <td id="bgCPrice">0</td>
	                            </tr>
	                            <tr>
	                                <td colspan="5" align="center">
	                                    <input type="button" class="inputButton" value="티켓 추가" id="btnInsert">
	                                    <input type="button" class="inputButton" value="수정/삭제" id="btnEdit">
	                                    <input type="reset" value="초기화">
	                                </td>
	                            </tr>
	                        </table>
	                    </form>    
                        <hr>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-table me-1"></i>
                            티켓 구매 목록
                        </div>

                        <div class="tableContent">
                            <input type="hidden" id="nowPage" name="nowPage" value="1">
                            <input type="hidden" id="startNum" name="startNum" value="1">
                            <input type="hidden" id="endNum" name="endNum" value="15">
                            <table id="table" class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">No</th>
                                        <th scope="col">아이디</th>
                                        <th scope="col">이름</th>
                                        <th scope="col">성별</th>
                                    </tr>
                                </thead>
                            </table>

                            <nav aria-label="Page navigation example">
                                <ul class="pagination justify-content-center">
                                    <!-- 이전페이지 -->
                                    <li class="page-item prev" onclick="prevPage()">
                                        <a class="page-link">Previous</a>
                                    </li>

                                    <div class="pageBox">
                                        <div class="pageCon">
                                        </div>
                                    </div>
                                    <!-- 다음페이지 -->
                                    <li class="page-item after" onclick="nextPage()">
                                        <a class="page-link">Next</a>
                                    </li>
                                </ul>
                            </nav>
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
    <script src="../js/scripts.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
    <script src="assets/demo/chart-area-demo.js"></script>
    <script src="assets/demo/chart-bar-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
        crossorigin="anonymous"></script>
    <script src="../js/datatables-simple-demo.js"></script>
    <!-- 드림즈 테이블, chartJs -->
    <script src="../js/admin.js"></script>
</body>

</html>