<%@page import="pj.mvc.jsp.dto.TicketDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/layout/setting.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>티켓 결제</title>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
	
</script>

<style>
.purchase {
	display: flex;
	background: white;
}

.purchase elements {
	display: block;
	border: 1px;
	height: 498px;
}

table {
	border-collapse: collapse;
	border: 1px solid black;
	border-left: none;
	border-right: none;
}

table thead {
	background: whitesmoke;
	border-top: 3px solid black;
	border-bottom: 2px solid black;
	border-left: none;
	border-right: none;
}
</style>
</head>
<body style="background: #1c5c50;">
	<div class="purchase">
		<div class="elements">
			<h3>예매 내역</h3>
			<form name="reservationForm" method="post">
				<table>
					<thead>
						<tr>
							<th>티켓번호</th>
							<th>좌석</th>
							<th>경기 날짜</th>
							<th>구매 날짜</th>
							<th>구매 가격</th>
							<th>취소</th>
						</tr>
					</thead>
					<c:forEach var="trdto" items="${list }">
						<tr id="normal-price">
							<td>${trdto.ticket_no }</td>
							<td>${trdto.ticket_seat }</td>
							<td>${trdto.game_date }</td>
							<td>${trdto.purchase_date }</td>
							<td>${trdto.ticket_price }</td>
							<td><input type="button" id="cancle" name="cancle" value="예매 취소"></td>
						</tr>
					</c:forEach>
				</table>
			</form>
		</div>
	</div>
</body>
</html>