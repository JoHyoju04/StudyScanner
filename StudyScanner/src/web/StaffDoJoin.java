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


@WebServlet("/StaffDoJoin")
public class StaffDoJoin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public StaffDoJoin() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		ServletContext sc = getServletContext();
        String uploadPath=sc.getRealPath("/upload/");
       
		int size = 10*1024*1024;
		String s_bn="";
		
		
		MultipartRequest multi=new MultipartRequest(request,uploadPath,size,"UTF-8",new DefaultFileRenamePolicy());


			String uid = multi.getParameter("s_id");
			String passwd = multi.getParameter("s_passwd");
			String passwdCheck=multi.getParameter("s_passwdCheck");
			String cafeName =multi.getParameter("cafeName");
			String address =multi.getParameter("address");

				s_bn = multi.getFilesystemName("s_bn"); //업로드 이름

				String orgFile = multi.getOriginalFileName("s_bn"); //업로드 된 이름

				String s_bn2="/upload/"+s_bn;
		
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			System.out.print(conn);
			DBUtil.createSUser(conn, uid,passwd,cafeName,address,s_bn2);
			
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>alert('회원가입이 되었습니다.'); location.href='s_Login.jsp';</script>");
			 
			out.flush();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
