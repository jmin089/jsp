<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키 저장</title>
	</head>
	<body>
		<%
		String cname = request.getParameter("co_name");
		String cvalue = request.getParameter("co_value");
		
		Cookie c1 = new Cookie(cname, cvalue);
		
		c1.setMaxAge(60*10); //60초 * 10분
		response.addCookie(c1);
		
		response.sendRedirect("co_list.jsp");
		%>
	</body>
</html>