package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.BListService;
import com.java.www.service.DoBInsertService;
import com.java.www.service.MDoLoginService;
import com.java.www.service.Service;
import com.java.www.service.bViewService;
import com.java.www.service.doBUpdateService;

@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		String url = null;
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fName = uri.substring(cPath.length());
		System.out.println("클릭한 파일 : "+fName);
		Service service = null;
		
		switch (fName) {
		case "/index.do":
			response.sendRedirect("index.jsp");
			break;
		case "/memInsert.do":
			response.sendRedirect("memInsert.jsp");
			break;
		case "/login.do":
			response.sendRedirect("login.jsp");
			break;
		case "/doLogin.do":
			service = new MDoLoginService();  //다형성
			service.execute(request, response);
			url = "doLogin.jsp";
			break;
		case "/logout.do":
			response.sendRedirect("logout.jsp");
			break;
		case "/bList.do":
			service = new BListService();  //다형성
			service.execute(request, response);
			url = "bList.jsp";
			break;
		case "/bInsert.do":
			response.sendRedirect("bInsert.jsp");
			break;
		case "/doBInsert.do":
			service = new DoBInsertService();  //다형성
			service.execute(request, response);
			url = "doBInsert.jsp";
			break;
		case "/bView.do":
			service = new bViewService();  //다형성
			service.execute(request, response);
			url = "bView.jsp";
			break;
		case "/bUpdate.do":
			service = new bViewService();  //다형성
			service.execute(request, response);
			url = "bUpdate.jsp";
			break;
		case "/doBUpdate.do":
			service = new doBUpdateService();  //다형성
			service.execute(request, response);
			url = "doBUpdate.jsp";
			break;
		}//switch
		
		//url 있을때만 dispatcher 사용
		if(url!=null) {  //null일때는 response.sendRedDirect가 돌아가기 때문에 에러남.
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		//dispatcher는 삭제하기 않고 추가해서 같이 보내줌.
		//MDoLoginService에 result를 request, response 추가해서 url에 보내줌.
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
}
