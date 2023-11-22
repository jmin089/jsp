package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.DoMInsertService;
import com.java.www.service.DoMUpdateService;
import com.java.www.service.MDoLoginService;
import com.java.www.service.MUpdateService;
import com.java.www.service.Service;

@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		
		//변수선언
		String url = null;
		Service service = null;
		
		//호출한 파일 이름
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fName = uri.substring(cPath.length());
		System.out.println("호출한 파일 이름: "+fName);
		
		switch (fName) {
		case "/index.do":  //db연결이 필요없음. - response.sendRedirect
			response.sendRedirect("index.jsp");
			break;
			
		case "/mInsert.do":  //db연결이 필요없음. - response.sendRedirect
			response.sendRedirect("mInsert.jsp");
			break;
			
		case "/doMInsert.do":  //db연결이 필요있음. - RequestDispatcher
			//객체선언 DoMInsertService
			service = new DoMInsertService();
			service.execute(request, response);
			url = "doMInsert.jsp";
			break;
			
		case "/login.do":  //db연결이 필요없음. - response.sendRedirect
			response.sendRedirect("login.jsp");
			break;
			
		case "/logout.do":  //db연결이 필요없음. - response.sendRedirect
			response.sendRedirect("logout.jsp");
			break;
			
		case "/doLogin.do":  //db연결이 필요있음. - RequestDispatcher
			//객체선언 MDoLoginService
			service = new MDoLoginService();
			service.execute(request, response);
			url = "doLogin.jsp";
			break;
			
		case "/mUpdate.do":  //db연결이 필요있음. - RequestDispatcher
			//객체선언  MUpdateService
			service = new MUpdateService();
			service.execute(request, response);
			url = "mUpdate.jsp";
			break;
			
		case "/doMUpdate.do":  //db연결이 필요있음. - RequestDispatcher
			//객체선언  DoMUpdateService
			service = new DoMUpdateService();
			service.execute(request, response);
			url = "doMUpdate.jsp";
			break;
		}
		
		if(url!=null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		}
				
	}//doAction
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}//doGet
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}//doPost
}//FController
