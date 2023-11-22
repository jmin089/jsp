package com.java.www.service;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class MIdCheckService {

	public int idCheck(String id) {
		int result = 0;
		//객체선언
		MemberDao mdao = new MemberDao();
		
		//MemberDao 접근
		MemberDto mdto = mdao.idCheck(id);
		
		//id가 존재하지 않으면 1 존재하면 0
		if(mdto==null) result = 1;
		
		return result;
	}
	
}//MIdCheckService
