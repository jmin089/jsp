<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>logout</title>
	</head>
	<body>
		<%
			session.invalidate();
		%>
		<script>
			alert("로그아웃되었습니다.");
			location.herf="jsp_main.jsp";
		</script>
	</body>
</html>