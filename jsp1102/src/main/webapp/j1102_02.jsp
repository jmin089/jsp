<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>jsp-스크립트릿</title>
		<style>
			table{width:400px; margin: 50px auto;}
			th,td{width:80px; height:30px; }
			table,th,td{text-align:center;
			border:1px solid black; border-collapse : collapse;}
		</style>
	</head>
	<body>
			<table>
		 	<tr>
			<th>단</th>
			<th>*</th>
			<th>숫자</th> 
			<th>=</th> 
			<th>곱셈</th> 
			</tr>
			<%
			
			for(int i=2;i<=9;i++){
				 for(int j=1;j<=9;j++){
			%>
		 	<tr>
				<td><%=i%></td>
				<td>*</td>
				<td><%=j%></td> 
				<td>=</td> 
				<td><%=(i*j)%></td> 
			</tr>
			<%
				}//j
			}//i
			
			%>
		
		</table>
		<%
		//구구단을 출력해보세요.
		//밑으로 출력
		for(int i=2;i<=9;i++){
				out.println("<h1>["+i+"단]</h1>");		
			for(int j=1;j<=9;j++){
				out.println(i +"*"+ j + "=" + (i*j)+"<br>");
			}//j
			out.println("<br>");
		}//i
		

		//한줄로 출력
		for(int i=2;i<=9;i++){
				out.println("<h1>["+i+"단]</h1>");		
			for(int j=1;j<=9;j++){
				out.println(i +"*"+ j + "=" + (i*j));
			}//j
				out.println("<br>");
		}//i
				out.println("<br>");
		
		%>
	

	
	
	
	</body>
</html>