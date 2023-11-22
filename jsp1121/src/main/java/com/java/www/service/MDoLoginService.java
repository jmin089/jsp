package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class MDoLoginService implements Service{

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		System.out.println("MDoLoginService id : "+id);
		//객체선언
		MemberDao mdao = new MemberDao();
		//MemberDao 접근
		MemberDto mdto = mdao.DoLogin(id, pw);
		
		//비교 - id, pw로 검색된것이 없으면 null값으로 리턴
		int result = 0; 
		if(mdto!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("session_id", mdto.getId());
			session.setAttribute("session_name", mdto.getName());
			result = 1;
		}
		System.out.println("MDoLoginService result : "+result);
		//request 추가
		request.setAttribute("result", result);
		
	}//execute

}//MDoLoginService
