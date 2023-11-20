package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class MDoLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("Service id : "+id);
		
		//객체선언
		MemberDao mdao = new MemberDao();
		//DB에 접근 - id, pw를 가지고 1명의 회원검색
		MemberDto mdto = mdao.mDoLogin(id, pw);
		//1명이 검색되었는지 확인
		int result = 0;  //검색이 되었으면 1, 검색이 안되었으면 0 console에 출력
		if(mdto!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("session_id", mdto.getId());
			session.setAttribute("session_name", mdto.getName());
			result = 1;
		}
		//requset에 객체 담아서 Frontcontroller로 보내주기
		request.setAttribute("result", result);  //("result" - 변수선언, result - 데이터값)
		
	}//execute
}//class
