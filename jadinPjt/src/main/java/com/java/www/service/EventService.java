package com.java.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.EventDao;
import com.java.www.dto.BoardDto;

public class EventService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//EventDao 접근
		EventDao edao = new EventDao();
		ArrayList<BoardDto> list = edao.selectAll();
		
		//request추가
		request.setAttribute("list", list);

	}

}
