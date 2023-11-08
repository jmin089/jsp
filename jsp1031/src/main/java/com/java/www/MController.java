package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MC")
public class MController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		request.setCharacterEncoding("utf-8");  
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		String str_script = "";
		if(id.equals("aaa") && pw.equals("1111")) {
			str_script = "alert('로그인 되었습니다.');";
			str_script += "location.href='layout/main.html';";
		}else {
			str_script = "alert('아이디 또는 패스워드가 일치하지 않습니다. 다시 로그인해주세요.');";
			str_script += "history.back();";
		}
		
		writer.println("<html>");
		writer.println("<head><title>로그인</title></head>");
		writer.println("<script>");
		writer.println(str_script);
		writer.println("</script>");
		writer.println("<body>");
		writer.println("아이디 : "+id);
		writer.println("<br>");
		writer.println("패스워드 : "+pw);
		writer.println("<br>");
		writer.println("</body>");
		writer.println("</html>");
	}//doAction
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);   //request - 요청하는 객체 response - 받는 객체
	}//doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);   //request - 요청하는 객체 response - 받는 객체
	}//doPost

}//class
