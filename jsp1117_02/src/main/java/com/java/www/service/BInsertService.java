package com.java.www.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		BoardDao bdao = new BoardDao();
		
		String btitle = "", bcontent = "", id = "", bfile = "";
		int result = 0;
		BoardDto bdto = null;
		
		String upath = "c:/upload";
		int size = 10*1024*1024;
		try {
			MultipartRequest multi = new MultipartRequest(request, upath, size, "utf-8", new DefaultFileRenamePolicy());
			btitle = multi.getParameter("btitle");
			System.out.println("BInsertService : "+btitle);
			bcontent = multi.getParameter("bcontent");
			id = multi.getParameter("id");
			bfile = multi.getParameter("bfile");
			
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String f = (String)files.nextElement();
				bfile = multi.getFilesystemName(f);
			}
			
			bdto = new BoardDto(btitle, bcontent, id, bfile);
			result = bdao.bInsert(bdto);
			
		} catch (Exception e) { e.printStackTrace();
		} 

	}

}
