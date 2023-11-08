<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-스트릿트립</title>
	</head>
	<body>
		<%
		int i = 0;
		for(i=0;i<9;i++){
			out.println("2 * "+i+" = "+(2*i)+"<br>");
		%>
		------------<br>
		<%
		}
		%>
		<%
		
			int a = 5;
			if(a%2!=0){  //로그인 버튼을 클릭했을때 아이디, 패스워드가 일치하면1, 일치하지 않으면 0을 리턴
		%>
			<h2>홍길동님 환영합니다.</h2>
		<%	
			}else{
		%>
			<h2>아이디 또는 패스워드가 일치하지않습니다. 다시확인하세요.</h2>
		<%	
			}
		%>
</html>