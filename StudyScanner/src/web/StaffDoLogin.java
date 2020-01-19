//관리회원 로그인
package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;

/**
 * Servlet implementation class StaffDoLogin
 */
@WebServlet("/StaffDoLogin")
public class StaffDoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffDoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
        response.setContentType("text/html; charset=UTF-8");
		
		PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(false);
		
		if(session.getAttribute("s_id")!= null) { //이미 세션이 존재한다면
			out.println("<script>alert('이미 로그인 되어있습니다.'); location.href='s_Choice.jsp';</script>");
		}
		else {
			String uid = request.getParameter("s_id");
			String passwd = request.getParameter("s_passwd");
			
			ServletContext sc = getServletContext();
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			
			ResultSet rs = DBUtil.findSUser(conn, uid);
		
//		String uid = request.getParameter("s_id");
//		String passwd = request.getParameter("s_passwd");
//		
//		ServletContext sc = getServletContext();
//		Connection conn= (Connection) sc.getAttribute("DBconnection");
//		
//		ResultSet rs = DBUtil.findSUser(conn, uid);
		
		
		if(rs==null) {
			out.println("<script>alert('가입하지 않은 아이디입니다.'); location.href='s_Login.jsp';</script>");
		}
		if (rs != null) {
			try {
				if(rs.next()) { // existing user
					String checkpw = rs.getString(1);
					if (checkpw.equals(passwd)){
						// valid user and passwd
						session.setAttribute("s_id",uid);
						session.setAttribute("s_passwd",passwd);
						out.println("<script>alert('로그인 성공하였습니다.'); location.href='s_Choice.jsp';</script>");
					}
					else {
						// wrong passwd
						out.println("<script>alert('잘못된 비밀번호입니다.'); location.href='s_Login.jsp';</script>");
					}
				}
				else {
					// invalid user
					out.println("<script>alert('가입하지 않은 아이디입니다.'); location.href='s_Login.jsp';</script>");
				}			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
