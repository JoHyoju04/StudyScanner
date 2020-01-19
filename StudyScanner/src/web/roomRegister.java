//스터디룸 등록
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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DBUtil;

/**
 * Servlet implementation class roomRegister
 */
@WebServlet("/roomRegister")
public class roomRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public roomRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session=request.getSession();
		
		ServletContext sc = getServletContext();
		
		String uploadPath=sc.getRealPath("/upload/");
	       
		int size = 10*1024*1024;	
		
		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());


			String s_RPhoto="";
			String s_roomName= multi.getParameter("s_roomName");
			String s_roomPrice = multi.getParameter("s_roomPrice");
			String s_roomPersonNum= multi.getParameter("s_roomPersonNumber");

			s_RPhoto= multi.getFilesystemName("s_RPhoto");//업로드 이름
			String s_photodb="/upload/"+s_RPhoto;//업로드 이름
			//String org1 = multi.getOriginalFileName("s_photo"); //업로드 된 이름
		
		
		String s_id=(String)session.getAttribute("s_id");
		
		
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			
			int result=DBUtil.registerRoom(conn,s_id,s_roomName,s_roomPrice,s_roomPersonNum,s_photodb);
			System.out.println(Integer.toString(result));
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(result !=0) {
				out.println("<script>alert('등록되었습니다.'); location.href='room_Registration.jsp';</script>");
				//response.sendRedirect("room_Registration.jsp");
			}else {
				out.println("<script>alert('다시 등록해주세요.'); location.href='room_Registration.jsp';</script>");
			}
			out.flush();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
