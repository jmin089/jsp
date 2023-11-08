<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 확인</title>
	</head>
	<body>
		<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		if(id.equals("admin") && pw.equals("1111")){  //성공할 경우
			//HttpSession session = request.getSession();  //자동선언으로 skip
			session.setAttribute("session_id", id);
			session.setAttribute("session_nicName", "유진스");
		%>
		<script>
		 alert("로그인 되었습니다.");
		 location.href="../layout/main.jsp";
		</script>
		<%}else{  //실패할 경우%>
			<script>
			alert("아이디 또는 패스워드를 확인하시기 바랍니다.")
			location.href="login.jsp";
			//histoty.back() / location.href= 둘중 하나 사용가능
			</script>
		<% }%>
	</body>
</html>