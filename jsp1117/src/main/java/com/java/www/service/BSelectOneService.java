package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class BSelectOneService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		//dao접근
		int bno = Integer.parseInt(request.getParameter("bno"));
		BoardDao bdao = new BoardDao();
		//조회수 1씩 증가
		bdao.bHitUp(bno);      //증가가 된 값을 가져오고
		//1개 게시글 가져오기
		BoardDto bdto = bdao.selectOne(bno);      //증가가 안된 값을 가져옴
		
		//request 추가
		request.setAttribute("bdto", bdto);
		

	}

}
