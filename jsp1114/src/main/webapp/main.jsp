<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>main.jsp</title>
	</head>
	<body>
		<h1>메인페이지</h1>
		<ul>
			<a href="login.do"><li>do.로그인페이지</li></a><!-- FrontController페이지로 이동 -->
			<a href="write.do"><li>do.글쓰기</li></a>    <!-- FrontController페이지로 이동 -->
			<a href="mwrite.do"><li>do.회원가입</li></a>  <!-- FrontController페이지로 이동 -->
			<hr>
			<!--직접연결은 이제 안할꺼임 
			<a href="login.jsp"><li>로그인페이지</li></a>  <!-- login.jsp페이지로 이동
			<a href="write.jsp"><li>글쓰기</li></a>      <!-- write.jsp페이지로 이동
			<a href="mwrite.jsp"><li>회원가입</li></a>    <!-- mwrite.jsp페이지로 이동
			 -->
		</ul>
	</body>
</html>