//관리회원 회원가입
package web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DBUtil;
import file.FileDTO;

/**
 * Servlet implementation class StaffDoJoin
 */
@WebServlet("/StaffDoJoin")
public class StaffDoJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StaffDoJoin() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		ServletContext sc = getServletContext();
        String uploadPath=sc.getRealPath("/upload/");
       
		int size = 10*1024*1024;
		String s_bn="";
		
		
		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());

			//Enumeration en = multi.getParameterNames();

			String uid = multi.getParameter("s_id");
			String passwd = multi.getParameter("s_passwd");
			String passwdCheck=multi.getParameter("s_passwdCheck");
			String cafeName =multi.getParameter("cafeName");
			String address =multi.getParameter("address");
		

		

				//String fname = (String)en.nextElement(); // map형식으로 랜덤하게

				s_bn = multi.getFilesystemName("s_bn"); //업로드 이름

				String orgFile = multi.getOriginalFileName("s_bn"); //업로드 된 이름
			
			
			
			//Enumeration files = multi.getFileNames();
//			String file1 = (String)files.nextElement();
//			s_bn = multi.getFilesystemName(file1);
				
				String s_bn2="/upload/"+s_bn;
				System.out.println(uid);
				System.out.print(s_bn2);
				System.out.print(passwd);
				System.out.print(cafeName);
				System.out.print(address);
		
		
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			System.out.print(conn);
			DBUtil.createSUser(conn, uid,passwd,cafeName,address,s_bn2);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입이 되었습니다.'); location.href='s_Login.jsp';</script>");
			 
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
