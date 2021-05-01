//고객회원 회원가입
package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.DBUtil;

@WebServlet("/ClientDoJoin")
public class ClientDoJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ClientDoJoin() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("c_name");
		String uid = request.getParameter("c_id");
		String passwd = request.getParameter("c_passwd");
		String passwdCheck=request.getParameter("c_passwdCheck");
		String phone = request.getParameter("phoneNum");
		
		

			ServletContext sc = getServletContext();
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			
			DBUtil.createUser(conn, uid,passwd,name,phone);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('로그인되었습니다.'); location.href='c_Login.jsp';</script>");
			 
			out.flush();
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
