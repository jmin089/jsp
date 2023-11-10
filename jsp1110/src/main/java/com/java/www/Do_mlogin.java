package com.java.www;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.java.www.dao.MemberDao;
import com.java.www.dto.MemberDto;

@WebServlet("/Do_mlogin")
public class Do_mlogin extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");  //한글처리
		String uid = request.getParameter("id");
		String upw = request.getParameter("pw");
		//객체선언후 메소드호출
		MemberDao mdao = new MemberDao();
		MemberDto mdto = mdao.mloginCheck(uid, upw);
		String msg = "";
		String url = "";
		if(mdto==null) {  //실패시
			msg = "아이디 또는 패스워드가 일치 하지 않습니다. 다시 입력해해해해해";
			url = "mlogin.jsp";
		}else {  //성공시
			session.setAttribute("session_id", uid);
			session.setAttribute("session_name", mdto.getName());
			msg = "로그인 성공이랴랴랴랴랴랴랴랴";
			url = "mindex.jsp";
		}//if
		
		//html 페이지
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.println("<html>");
		writer.println("<head>");
		writer.println("<title>로그인체크</title>");
		writer.println("</head>");
		writer.println("<body>");
		writer.println("<script>");
		writer.println("alert('"+msg+"');");
		writer.println("location.href='"+url+"';");
		writer.println("</script>");
		writer.println("</body>");
		writer.println("</html>");
		writer.close();
		
	}//doAction
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
