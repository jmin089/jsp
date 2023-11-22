package com.java.www.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;


@WebServlet("/IdCheck")
public class IdCheck extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		System.out.println("idCheck.do id : "+request.getParameter("chId"));
		response.setCharacterEncoding("utf-8");
		JSONArray jArray = new JSONArray();
		JSONObject jObject = new JSONObject();
		jObject.put("result", "1");
		jArray.add(jObject);
		//response.getWriter().print(jArray);
		response.getWriter().print(jObject);
	}
	//-------------------------
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}

