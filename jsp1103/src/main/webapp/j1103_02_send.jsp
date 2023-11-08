<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>확인페이지</title>
	</head>
	<body>
		<%
			String jumin = request.getParameter("jumin");
			String name = URLEncoder.encode(request.getParameter("name"));
			//out.println("주민번호 : "+jumin+"<br>");
			//880101-1111111 2023~1988 = 35
			//030101-4111111 2023~2003 = 20
			//주민번호를 이용해서 나이를 출력하세요.
			
			//주민번호 7번째자리 가져옴.
			int ju1 = Integer.parseInt(jumin.substring(7,8));
			//주민번호 첫번째 2자리 가져옴.
			String ju2 = jumin.substring(0,2);  //0번째부터 2번 앞에꺼까지 출력
			int age = 0, ju_num = 0;
			if(ju1==1 || ju1==2) {
				ju_num = Integer.parseInt("19"+ju2);
				age = 2023 - ju_num;
			}else{
				ju_num = Integer.parseInt("20"+ju2);
				age = 2023 - ju_num;
			}
			//out.println("당신의 나이 : "+age+"<br>");
			//if(age>=19) response.sendRedirect("success.jsp?age="+age+"&name="+name);
			//else response.sendRedirect("reject.jsp?age="+age+"&name="+name);
		%>
	</body>
</html>