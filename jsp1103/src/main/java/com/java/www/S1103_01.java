package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/S01")
public class S1103_01 extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		//console창에 구구단 출력
		for(int i=2;i<=9;i++) {
			for(int j=1;j<=9;j++) {
				System.out.println(i+"*"+j+"="+(i*j));
			}
		}
		
		int sum = 0;
		for(int i=0;i<=100;i++) {
			sum += i;
		}
		System.out.println(sum);
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head><title>표</title></head>");
		writer.println("<style>table,th,td{border:1px solid black; border-collapse:collapse;}</style>");
		writer.println("<body>");
		writer.println("<table>");
		writer.println("<tr><th>단</th><th>*</th><th>숫자</th><th>=</th><th>곱셈</th></tr>");
		for(int i=2;i<=9;i++) {
			for(int j=1;j<=9;j++) {
				writer.println("<tr>");
				writer.println("<td>"+i+"</td>");
				writer.println("<td>*</td>");
				writer.println("<td>"+i+"</td>");
				writer.println("<td>=</td>");
				writer.println("<td>"+(i*j)+"</td>");
				writer.println("</tr>");
			}
		}
		writer.println("</table>");
		writer.println("</body>");
		writer.println("</html>");

	}//doAction

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}
}
