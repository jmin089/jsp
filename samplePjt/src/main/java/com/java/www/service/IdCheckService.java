package com.java.www.service;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

public class IdCheckService {
	
	public String idCheck(String id) {
		String result =null;
		//dao접근
		MemberDao mdao = new MemberDao();
		MemberDto mdto = mdao.selectOne(id);
		
		if(mdto==null) result = "사용 가능한 아이디 입니다.";
		else result = "사용 불가능한 아이디 입니다.";
		//FConroller로 이동
		
		return result;
	}
	
}
