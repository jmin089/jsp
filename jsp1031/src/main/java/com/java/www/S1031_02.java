package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S02")
public class S1031_02 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");  //post 한글철기
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		
		String[] subjects = request.getParameterValues("subject");
		String subject = "";
		for(int i=0;i<subjects.length;i++) {
			if(i==0) subject=subjects[i];
			else subject += "," + subjects[i];
		}
		
		int kor = Integer.parseInt(request.getParameter("kor"));
		int eng = Integer.parseInt(request.getParameter("eng"));
		int math = Integer.parseInt(request.getParameter("math"));
		int total = kor+eng+math;
		double avg =total/3.0;
		String str_avg = String.format("%.2f", avg);
		double b_avg = Double.parseDouble(str_avg); //String을 다시 숫자로 변경할때 
				
		writer.println("<html>");
		writer.println("<head></head>");
		writer.println("<body>");
		writer.println("학번 : "+request.getParameter("no"));
		writer.println("<br>");
		writer.println("이름 : "+request.getParameter("name"));
		writer.println("<br>");
		writer.println("국어점수 : "+request.getParameter("kor"));
		writer.println("<br>");
		writer.println("영어점수 : "+request.getParameter("eng"));
		writer.println("<br>");
		writer.println("수학점수 : "+request.getParameter("math"));
		writer.println("<br>");
		writer.println("합계점수 : "+total);
		writer.println("<br>");
		writer.println("평균점수 : "+b_avg);
		writer.println("<br>");
		writer.println("개열선택 : "+request.getParameter("major"));
		writer.println("<br>");
		writer.println("좋아하는과목 배열 : "+Arrays.toString(request.getParameterValues("subject")));
		writer.println("<br>");
		writer.println("좋아하는과목 1가 문자열 : "+subject);
		writer.println("<br>");
		writer.println("주소 : "+request.getParameter("address"));
		writer.println("<br>");
		writer.println("</body>");
		writer.println("</html>");
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
