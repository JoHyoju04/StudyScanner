//고객회원 로그인
package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DBUtil;


/**
 * Servlet implementation class DoLogin
 */
@WebServlet("/DoLogin")
public class ClientDoLogin extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClientDoLogin() {
        super();
        // TODO Auto-generated constructor stub
    }

   /**
    * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
   }

   /**
    * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
    */
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      // TODO Auto-generated method stub
         HttpSession session=request.getSession(false);

      request.setCharacterEncoding("UTF-8");
      String uid = request.getParameter("c_id");
      String passwd = request.getParameter("c_passwd");
      
      ServletContext sc = getServletContext();
      Connection conn= (Connection) sc.getAttribute("DBconnection");
      
      ResultSet rs = DBUtil.findUser(conn, uid);
      
      
      response.setContentType("text/html; charset=UTF-8");
      
      PrintWriter out = response.getWriter();
      if(rs==null) {
         out.println("<script>alert('가입하지 않은 아이디입니다.'); location.href='c_Login.jsp';</script>");
      }
      if (rs != null) {
         try {
            if(rs.next()) { // existing user
               String checkpw = rs.getString(1);
               if (checkpw.equals(passwd)){
                  // valid user and passwd
                  //out.println("<h2>Login Success!!<h2>");
                  if((DBUtil.lockStatus(conn, uid))==3) {
                     out.println("<script>alert('경고 3회로 비활성화 된 아이디입니다. 운영자에게 문의 남겨주세요.'); location.href='index.html';</script>");
                  }
                  else {
                  session.setAttribute("c_id",uid);
                        session.setAttribute("c_passwd",passwd);
                  out.println("<script>alert('로그인 성공하였습니다.'); location.href='c_Search.jsp';</script>");
               }}
               else {
                  // wrong passwd
                  out.println("<script>alert('잘못된 비밀번호입니다.'); location.href='c_Login.jsp';</script>");
               }
            }
            else {
               // invalid user
               out.println("<script>alert('가입하지 않은 아이디입니다.'); location.href='c_Login.jsp';</script>");
            }         
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
      }
   }

}