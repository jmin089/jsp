package com.java.www.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.java.www.dao.BoardDao;
import com.java.www.dto.BoardDto;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;


public class DoBInsertService implements Service {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) {
		
		String btitle="", id="", bcontent="", bfile="";
		String upload = "c:/upload"; //c폴더의 upload폴더에 저장하겠다.
		int size = 10*1024*1024;  //용량은 10MB까지 올리겠다.
		try {
			MultipartRequest multi = new MultipartRequest(request, upload, size, "utf-8", new DefaultFileRenamePolicy());
			
			btitle = multi.getParameter("btitle");
			System.out.println("execute btitle : "+btitle);
			id = multi.getParameter("id");
			bcontent = multi.getParameter("bcontent");
			
			//파일이름 form에서 input type="file" name을 가지고 와서 files에 넣음
			Enumeration files = multi.getFileNames();
			while(files.hasMoreElements()) {
				String f = (String)files.nextElement();
				bfile = multi.getFilesystemName(f);  //여러가지일때는 배열로 가져오기
			}
			//dto 객체를 담음
			BoardDto bdto = new BoardDto(btitle, bcontent, id, bfile);
			
			//객체선언
			BoardDao bdao = new BoardDao();
			int result = bdao.bInsert(bdto);
			System.out.println("execute result : "+result);
		} catch (Exception e) { e.printStackTrace();}
	}//execute
}//class
