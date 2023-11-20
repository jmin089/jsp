package com.java.www.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.BInsertService;
import com.java.www.service.BListService;
import com.java.www.service.BSelectOneService;
import com.java.www.service.MDoLoginService;
import com.java.www.service.Service;

@WebServlet("*.do")
public class FController extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fName = uri.substring(cPath.length());
		System.out.println("파일이름 : "+fName);
		
		Service service = null;
		String url = null;
		
		switch (fName) {
		case "/index.do":
			response.sendRedirect("index.jsp");
			break;
			
		case "/login.do":
			response.sendRedirect("login.jsp");
			break;
			
		case "/doLogin.do":
			service = new MDoLoginService();
			service.execute(request, response);
			System.out.println("FController : doLoign.jsp호출");//확인용
			url = "doLoign.jsp";
			break;
			
		case "/logout.do":
			response.sendRedirect("logout.jsp");
			break;
			
		case "/list.do":    //게시글
			service = new BListService();
			service.execute(request, response);
			System.out.println("FController : list.jsp호출");//확인용
			url = "list.jsp";
			break;
			
		case "/view.do":     //게시글 1개 내용보기
			service = new BSelectOneService();
			service.execute(request, response);
			System.out.println("FController : view.jsp호출");//확인용
			url = "view.jsp";
			break;
			
		case "/insert.do":    //게시글 화면
			response.sendRedirect("insert.jsp");
			break;
			
		case "/doBInsert.do":   //게시글 작성
			service = new BInsertService();
			service.execute(request, response);
			System.out.println("FController : doBInsert.jsp호출");//확인용
			url = "doBInsert.jsp";
			break;
			
		}//switch
		if(url!=null) {
		RequestDispatcher dispatcher = request.getRequestDispatcher(url);
		dispatcher.forward(request, response);
		}
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
