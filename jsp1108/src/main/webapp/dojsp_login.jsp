<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>id,pw 체크</title>
	</head>
	<body>
		<%
			/*request.setCharacterEncoding("utf-8");*/
		
			String uid = request.getParameter("id");
			String upw = request.getParameter("pw");
		
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			String id, pw;
			
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","ora_user", "1111");
			stmt = conn.createStatement();
			String query = "select * from member where id = '"+uid+"' and pw = '"+upw+"'";  //DB에 있는 아이디 패스워드만 로그인
			//String query = "select count(*) as lcheck from member where id = '"+uid+"' and pw = '"+upw+"'";//어떤 아이디 패스워드를 입력해도 로그인
			rs = stmt.executeQuery(query);
			//id,pw 틀렸어요. -> 0 값이 리턴됨.
			if(rs.next()){
				//int lcheck = rs.getInt("lcheck");
				//if(lcheck>0){
				session.setAttribute("session_id",uid);
				session.setAttribute("session_nicName",upw+"스");
		%>
			<script>
				alert("로그인 되었습니다.");
				<%--alert("<%=lcheck%>개 로그인 되었습니다.");--%>
				location.href="jsp_main.jsp";
			</script>
		<%}else{%>
			<script>
				alert("아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인해주세요.");
				location.href="jsp_login.jsp";
			</script>
		<%}%>
			
	</body>
</html>