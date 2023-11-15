package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class DoLoginService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		//객체선언
		MemberDao mdao = new MemberDao();
		//id, pw를 가지고 회원정보 검색
		MemberDto mdto = mdao.doLoogin(id, pw);
		//회원정보확인
		int result = 0;
		if(mdto!=null) {
			HttpSession session = request.getSession();
			session.setAttribute("session_id", mdto.getId());
			session.setAttribute("session_name", mdto.getName());
			result = 1;  //성공이면 1, 실패이면 0
		}
		//request객체 -  result변수 추가
		request.setAttribute("result", result);
	}

}
