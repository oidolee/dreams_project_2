<%@page import="dbConn.DbTest"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	dbTest
	<%
		Connection conn = null;
		conn = DbTest.getConnection();
		out.println("연결성공 : " + conn + "<br>");		
	%>
</body>
</html>