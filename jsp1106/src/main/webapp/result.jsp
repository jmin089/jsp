<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>결과페이지</title>
	</head>
	<body>
		<h2>3. jsp액션태그 param 데이터 전송 결과페이지</h2>
		<h2>ip번호 : <%=request.getParameter("ipParam") %></h2>
		
		<hr>
		<h2>2. 파라미터로 데이터 전송 결과페이지</h2>
		<h2>ip번호 : <%=request.getParameter("ipAdd") %></h2>
		<hr>
		<h2>1. form으로 데이터 전송결과 페이지</h2>
		<h2>ip번호 : <%=request.getParameter("ip") %></h2>
		
		<!-- 모두 전송하면 위에 값만 넘어오고 나머지는 null로 표시 -->
		
	</body>
</html>