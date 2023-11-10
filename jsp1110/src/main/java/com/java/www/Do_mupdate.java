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

@WebServlet("/Do_mupdate")
public class Do_mupdate extends HttpServlet {
	
	protected void doAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doAction");
		request.setCharacterEncoding("utf-8");  //한글처리
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		String gender = request.getParameter("gender");
		String[] hobbys = request.getParameterValues("hobby");
		String hobby = "";
		for(int i=0;i<hobbys.length;i++) {
			if(i==0) hobby = hobbys[i];
			else hobby += "," + hobbys[i];
		}
		//1명의 회원정보수정 메소드호출
		MemberDao mdao = new MemberDao();
		int result = mdao.memberUpdate(id, phone, gender, hobby);
		String msg = "";
		String url = "";
		if(result==1) {  //실패시
			msg = "회원정보가 수정 성공공공공공공공";
			url = "mview.jsp?id="+id;
		}else {  //성공시
			msg = "회원정보가 수정 실패패패패패패패";
			url = "mview.jsp?id="+id;
		}//if
		
		//html 페이지
				response.setContentType("text/html; charset=utf-8");
				PrintWriter writer = response.getWriter();
				writer.println("<html>");
				writer.println("<head>");
				writer.println("<title>회원정보수정</title>");
				writer.println("</head>");
				writer.println("<body>");
				writer.println("<script>");
				writer.println("alert('"+msg+"');");
				writer.println("location.href='"+url+"';");
				writer.println("</script>");
				writer.println("</body>");
				writer.println("</html>");
				writer.close();
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doGet");
		doAction(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("doPost");
		doAction(request, response);
	}

}
