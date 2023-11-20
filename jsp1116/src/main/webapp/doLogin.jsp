<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인체크 - doLogin페이지</title>
	</head>
	<body>
		<c:if test="${result==1}">
			<script>
				alert("로그인 성공");
				location.href = "index.do";
			</script>
		</c:if>
		<c:if test="${result!=1}">
			<script>
				alert("로그인 실패 다시입력해!");
				location.href = "login.do";
			</script>
		</c:if>
	</body>
</html>