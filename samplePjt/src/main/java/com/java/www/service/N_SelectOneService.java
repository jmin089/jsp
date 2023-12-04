package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class N_SelectOneService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//dao접근
		int page = Integer.parseInt(request.getParameter("page"));
		int bno = Integer.parseInt(request.getParameter("bno"));
		String category = request.getParameter("category");
		String sword = request.getParameter("sword");
		BoardDao bdao = new BoardDao();
		BoardDto bdto = bdao.selectOne(bno);
		
		//파일이름 추출
		//---------------view 일때만---------------
		String uri = request.getRequestURI();
		String cPath = request.getContextPath();
		String fileName = uri.substring(cPath.length());
		BoardDto preDto = null;
		BoardDto nextDto = null;
		if(fileName.equals("/n_view.do")) {
			//pre +1
			preDto = bdao.preSelectOne(bno);
			//next -1
			nextDto = bdao.nextSelectOne(bno);
		}
		
		//request추가
		request.setAttribute("bdto", bdto);
		request.setAttribute("preDto", preDto);
		request.setAttribute("nextDto", nextDto);
		request.setAttribute("page", page);
		request.setAttribute("category", category);
		request.setAttribute("sword", sword);
	}
}
