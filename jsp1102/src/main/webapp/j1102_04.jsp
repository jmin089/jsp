<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-스트립트릿</title>
	</head>
	<body>
	<!-- html주석 : jsp프로그래밍 입니다. random함수를 사용했습니다.    이거는 노출이 됨.-->
	<%-- jsp주석 :  String.format함수를 사용 5자리 결과값 도출       이거는 노출이 안됨.--%>
		<%
		//랜덤으로 숫자 : 0 ~ 99999
		//자리수는 5자리가 되어야 함. 00001
		int num = (int)(Math.random()*100000);
		String str_num = String.format("%05d", num);
		out.println(str_num+"<br>");
		
		/*for(int i=0;i<100;i++){
		int num = (int)(Math.random()*100000);
		String str_num = String.format("%05d", num);
		out.println(str_num+"<br>");}                      5자리 랜덤숫자 100개 출력*/ 

		//5자라의 개별숫자의 합을 출력하시오. 02487 -> 21
		out.println(str_num.charAt(0)-'0'+"<br>");     //'0'을 빼면 타입이 숫자로 변경
		out.println(str_num.charAt(1)-'0'+"<br>");
		out.println(str_num.charAt(2)-'0'+"<br>");
		out.println(str_num.charAt(3)-'0'+"<br>");
		out.println(str_num.charAt(4)-'0'+"<br>");
		out.println("합계 : "+((str_num.charAt(0)-'0')+(str_num.charAt(1)-'0')+(str_num.charAt(2)-'0')+(str_num.charAt(3)-'0')+(str_num.charAt(4)-'0')));
		//소문자 a:97 - 대문자 A:65   0:48  1:49
		//대소문자 변경 +-32
		//'1' - '0' = 1 -> 49-48=1 50-48=2  문자 '0'을 빼면 숫자로 변경
		%>
	</body>
</html>