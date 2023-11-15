<%@page import="java.util.Arrays"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
		<meta charset="UTF-8">
		<title>결과</title>
		<style>
			span{font-size: 50px; font-weight: 700; color: red;}
			span:after{color: blue; content: ","}
		</style>
	</head>
	<body>
		<h2>섹션 : <%=session.getAttribute("seeeion_nicName") %></h2>
		<h2>배열취미 : <%=Arrays.toString(request.getParameterValues("hobby")) %></h2>  <!--결과값 :[game, golf]-->
		<h2>아이디 : <%=request.getParameter("id") %></h2>
		<h2>이름 : <%=request.getParameter("name") %></h2>
		<h2>숫자1 : <%=request.getParameter("num1") %></h2>  <!--num1 : 10 이고-->
		<h2>숫자2 : <%=request.getParameter("num2") %></h2>  <!--num2 : 20 일경우-->
		<h2>결과값1 : <%=request.getParameter("num1")+request.getParameter("num2")%></h2> <!--결과값 : 1020--> <!--형변환이 필요함(아래쪽처럼)-->
		<h2>결과값2 : <%=Integer.parseInt(request.getParameter("num1"))+Integer.parseInt(request.getParameter("num2"))%></h2>  <!--결과값 : 30-->
		<br>
		<h2>섹션1 : ${sessionScope.seeeion_nicName}</h2>
		<h2>섹션2 : ${seeeion_nicName}</h2>
		<h2>배열취미 : ${paramValues.hobby}</h2> <!--배열은 toString 사용할수 없음. c:forEach문 사용해야함.-->
		<c:forEach var="hobby" items="${paramValues.hobby}">
			<!--<h2>${hobby}</h2>-->  <!--결과값 : 새로로 하나씩 출력  game
																golf-->
			<span>${hobby}</span>  <!--(스타일 적용)결과값 : game, golf-->
		</c:forEach>
		<h2>아이디 : ${param.id}</h2>
		<h2>이름 : ${param.name}</h2>
		<h2>결과값 : ${param.num1 + param.num2}</h2> <!--결과값 : 30--> <!--EL태그 숫자는 형변환없이 자동으로 형변환-->
	</body>
</html>