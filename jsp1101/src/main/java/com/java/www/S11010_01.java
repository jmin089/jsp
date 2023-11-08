package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S01")
public class S11010_01 extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");  //post방식에 한글처리하기 위함
		
		String id = request.getParameter("id");  //request.getParameter("이름을 가지고오는거");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");  //남자, 여자 중 한개
		String address = request.getParameter("address");  //지역중 한개
		String[] hobbys = request.getParameterValues("hobby");  //중복선택
		String hobby = "";
		for(int i=0;i<hobbys.length;i++) {
			if(i==0) hobby = hobbys[i];     //게임 (1개 선택할때는) 
			else hobby += "," + hobbys[i];  //,골프,요리 (중북일때인데 중간에 ,는 if 결과뒤에 붙여서 결과값이 나옴. ,를 안하면 게임골프,요리.....으로 출력됨.
		}
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();  //웹에 페이지를 글자를 사용하겠다.
		
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>form데이터 결과</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<h3>아이디 : "+id+"</h3>");
		writer.println("<h3>패스워드 : "+pw+"</h3>");
		writer.println("<h3>이름 : "+name+"</h3>");
		writer.println("<h3>성별 : "+gender+"</h3>");
		writer.println("<h3>취미 배열 : "+Arrays.toString(hobbys)+"</h3>");
		writer.println("<h3>취미 : "+hobby+"</h3>");
		writer.println("<h3>주소 : "+address+"</h3>");
		writer.println("</body>");
		writer.println("</html>");
		
		writer.close();//사용안해도 아무일이 생기지는 않지만 기억하면 쓰자!!
	}//doAction
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}//doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}//doPost
	
}//class
