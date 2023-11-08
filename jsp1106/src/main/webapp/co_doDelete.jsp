<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>쿠키삭제</title>
		
	</head>
	<body>
		<%
			String cname = request.getParameter("co_name");
			Cookie[] cks = request.getCookies(); //쿠키 전체 가져오기.
			int check=0;
			if(cks != null){
				for(int i=0;i<cks.length;i++){
				if(cks[i].getName().equals(cname)){
					cks[i].setMaxAge(0);
					response.addCookie(cks[i]);
					check=1;
				}//if(equals)
					
				}//for
			}//if
			if(check==0){
			%>
				<script>
				alert("입력하신 쿠기를 찾을 수가 없습니다.");
				location.href="co_list.jsp";	
				</script>
			<%}else {%>
				<script>
				alert("쿠키를 삭제처리 했습니다.")
				location.href="co_list.jsp";
				</script>
			<%}%>	
		
	</body>
</html>