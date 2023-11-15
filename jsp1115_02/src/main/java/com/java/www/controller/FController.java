package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.BListService;
import com.java.www.service.DoLoginService;
import com.java.www.service.Service;

@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction 메소드 호출");
		request.setCharacterEncoding("utf-8");
		
		//모든 페이지는 *.do(FController) 들어옴.
		String url = null;
		//요청한 페이지를 알아내기 (url)http://localhost:8181/jsp1115/list.do
		String uri = request.getRequestURI();           //   /jsp1115/list.do
		String cPath = request.getContextPath();        //   /jsp1115
		String fName = uri.substring(cPath.length());   //   /list.do
		System.out.println("호출파일이름 : "+fName);
		
		//response.sendRedirect 사용하면 url 사용안함.
		if(fName.equals("/index.do")) {
			System.out.println("index.jsp 페이지를 열어줍니다.");
			url = "index.jsp";
		}
		else if(fName.equals("/login.do")) {
			System.out.println("login.jsp 페이지를 열어줍니다.");
			response.sendRedirect("login.jsp");
		}
		else if(fName.equals("/mwrite.do")) {
			System.out.println("mwrite.jsp 페이지를 열어줍니다.");
			response.sendRedirect("mwrite.jsp");
		}
		else if(fName.equals("/logout.do")) {
			System.out.println("logout.jsp 페이지를 열어줍니다.");
			response.sendRedirect("logout.jsp");
		}
		else if(fName.equals("/list.do")) {
			System.out.println("list.jsp 페이지를 열어줍니다.");
			//RequesDispatcher 선언해서 forward
			//db 접근이 필요함. - ArrayList
			Service service = new BListService();
			service.execute(request, response);
			url = "list.jsp";
		}
		else if(fName.equals("/doLogin.do")) {
			System.out.println("id, pw를 가지고 로그인 체크를 합니다.");
			//dao 호출
			//부모의 참조변수로 자손의 객체를 다루는 것 : 다형성  (다형성 사용하는 이유는 유지보수)
			Service service = new DoLoginService();
			service.execute(request, response);
			url = "doLogin.jsp";
		}
		
		if(url!=null) {  //url이 있으면 RequestDispatcher 없으면 response.sendRedirect
			//RequestDispatcher : request의 데이터를 그대로 추가해서 보내줌.
			RequestDispatcher dispatcher = request.getRequestDispatcher(url);
			dispatcher.forward(request, response);
		}//if
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
