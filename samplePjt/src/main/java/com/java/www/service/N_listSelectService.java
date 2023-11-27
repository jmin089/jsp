package com.java.www.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;

public class N_listSelectService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		//객체선언
		BoardDao bdao = new BoardDao();
		
		
		//-----------------------------------하단넘버링 시작----------------------------------------
		/*하단넘버링에 필요한거
		Page-현재페이지, listConut-게시글전체개수, maxPage-최대페이지, startPage-시작페이지, endPage-끝페이지,	*/
		int rowPage = 10;      //1페이지 당 10개의 게시물
		int bottomPage = 10;   //1,2,3,4,5,6,7,8,9,10
		int page = 1;
		if(request.getParameter("page")!=null)
			page = Integer.parseInt(request.getParameter("page"));  //page가 없는데, 에러남 그래서 if로 null인지 물어봐야함.
		System.out.println("service 현재 페이지이이이 : "+page);
		int listConut = bdao.nListCount();
		int maxPage = (int)Math.ceil((double)listConut/rowPage);
		int startPage = (int)((page-1)/bottomPage)*bottomPage+1;   //10까지는 무조건 1 다음 10까지는 11 다음 10까지는 21
		int endPage = startPage+bottomPage-1;   //10,20,30
		if(endPage>maxPage) endPage = maxPage;  //
		int startRow = (page-1) * rowPage + 1;     // 1,11,21,31,41
		int endRow = startRow + rowPage - 1;  //10,20,30,40,50
		//-----------------------------------하단넘버링 끝------------------------------------------
		
		//전체게시글 가져오기(BoardDao 접근)
		ArrayList<BoardDto> list = bdao.n_listSelect(startRow, endRow);
		
		//request 추가
		request.setAttribute("list", list);
		request.setAttribute("page", page);
		request.setAttribute("listConut", listConut);
		request.setAttribute("maxPage", maxPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);

	}

}
