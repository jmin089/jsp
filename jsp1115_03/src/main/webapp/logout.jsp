<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%session.invalidate();%>
	<script>
		alert("로그아웃 되었습니다아아");
		location.href="index.do";
	</script>
</body>
</html>