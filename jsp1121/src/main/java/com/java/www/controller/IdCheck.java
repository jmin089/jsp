package com.java.www.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.java.www.service.MIdCheckService;

@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {

	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		
		//전달받은 데이터
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		System.out.println("id : "+id);
		System.out.println("name : "+name);
		
		//service idChedk호출 - id를 보내서 중복체크 확인을 함.
		MIdCheckService mcs = new MIdCheckService();
		int result = mcs.idCheck(id);
		
		//json을 타입 변경
		JSONArray jArray = new JSONArray();  //json배열
		JSONObject jobj = new JSONObject();  //json배열안에 객체추가
		jobj.put("name", "jack");
		jobj.put("age", "30");
		jobj.put("result", result);
		jArray.add(jobj);
		System.out.println("json 타입 : "+jArray.toString());

		//response.setContentType("text/thml; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.print(jArray);
		
	}//doAction
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}
}//IdCheck