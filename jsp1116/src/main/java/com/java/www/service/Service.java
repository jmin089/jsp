package com.java.www.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Service {
	
	public void execute(HttpServletRequest request, HttpServletResponse response);
	
	/*(){} 까지 있어야 완성 메소드	 Service는 미완성 메소드로 만들기 */

}
