<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.PreparedStatement"%>
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
		<title>로그인 체크</title>
	</head>
	<body>
		<%
			request.setCharacterEncoding("utf-8");
			String uid = request.getParameter("id");
			String upw = request.getParameter("pw");
			
			//커넥션 풀 연결
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
					
			try{
				//커넥션 풀에서 Connection을 가져옴.
				Context context = new InitialContext();  //javax.naming으로 해야함.
				DataSource ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle18");  //오브젝트임으로 형변환(DataSource)해줌.
				conn = ds.getConnection();			
				//여기서부터는 동일함
				String query = "select * from member where id=? and pw=?";
				pstmt = conn.prepareStatement(query);
				pstmt.setString(1, uid);
				pstmt.setString(2, upw);
				rs = pstmt.executeQuery();
				if(rs.next()){
					session.setAttribute("session_id", uid);
					session.setAttribute("session_nicName", "길동스");
			%>
				<script>
					alert("로그인 되었습니다.");
					location.href="jsp_main.jsp";
				</script>
				<%}else{%>
				<script>
					alert("아이디 또는 패스워드가 잘못되었습니다. 다시 입력하세요.");
					location.href="jsp_login.jsp";
				</script>
				<%}%>
			<%}catch(Exception e){
					e.printStackTrace();
				}finally{
					try{
						if(rs!=null) rs.close();
						if(pstmt!=null) pstmt.close();
						if(conn!=null) conn.close();
					}catch(Exception e2){
						e2.printStackTrace();
					}
				}
		%>
	</body>
</html>