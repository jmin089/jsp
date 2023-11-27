package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class DoLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//전송데이터
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//객체선언
		MemberDao mdao = new MemberDao();
		//MemberDao 접근 - select
		MemberDto mdto = mdao.DoLoginSelect(id, pw);
		
		int result = 0;
		if(mdto!=null) {
			result = 1;
			HttpSession session = request.getSession();
			session.setAttribute("session_id", mdto.getId());
			session.setAttribute("session_name", mdto.getName());
		}
		//request 추가
		request.setAttribute("result", result);
		

	}

}
