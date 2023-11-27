package com.java.www.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.service.IdCheckService;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	//id를 가지고와서 중복체크
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		
		String id = request.getParameter("id");
		System.out.println("IdCheck id : "+id);
		
		//service 접근 하기 위해서 IdCheckService객체 만들어서 메소드 받아오기?
		IdCheckService IdCheckService = new IdCheckService();
		//리턴 - 사용가능, 사용불가능
		String result = IdCheckService.idCheck(id);
		
		//ajax 전송
		//리턴 받는 값이 text일때
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(result);     //아이디가 존재하지 않음
		//writer.print("fail");   //아이디가 존재함
		
		/*리턴 받는 값이 html일때
		response.setContentType("text/html; charset=utf-8"); -리턴할껀데 html로 리턴하겠다.
		response.setCharacterEncoding("utf-8");
		PrintWriter writer = response.getWriter();
		writer.print("success");  //아이디가 존재하지 않음*/
		
		writer.close();
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
