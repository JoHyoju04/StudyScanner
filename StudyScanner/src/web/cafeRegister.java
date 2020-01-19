//관리회원 회원가입시 카페등록
package web;

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
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import model.DBUtil;

/**
 * Servlet implementation class cafeRegister
 */
@WebServlet("/cafeRegister")
public class cafeRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public cafeRegister() {
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


			String s_photo1="";
			String s_photo2="";
			String s_photo3="";
			String s_tel = multi.getParameter("s_tel");
			String s_price=multi.getParameter("s_price");
			String s_time=multi.getParameter("s_time");

			s_photo1= multi.getFilesystemName("s_photo1");//업로드 이름
			String s_photodb1="/upload/"+s_photo1;//업로드 이름
			//String org1 = multi.getOriginalFileName("s_photo"); //업로드 된 이름
			
			s_photo2= multi.getFilesystemName("s_photo2");
			String s_photodb2="/upload/"+s_photo2;
			
			s_photo3= multi.getFilesystemName("s_photo3");
			String s_photodb3="/upload/"+s_photo3;
				
			Connection conn= (Connection) sc.getAttribute("DBconnection");
			
			System.out.println(s_tel);
			System.out.println(s_price);
			System.out.println(s_time);
			
			String s_id=(String)session.getAttribute("s_id");
			int check=DBUtil.createCafeInfo(conn,s_id,s_photodb1,s_photodb2,s_photodb3,s_tel,s_price,s_time);
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			if(check!=0) {
				out.println("<script>alert('카페등록이 완료되었습니다.'); location.href='s_Choice.jsp';</script>");
				out.flush();
			}
			else {
				out.println("<script>alert('등록안됨.'); location.href='cafe_Registration.jsp';</script>");
				out.flush();
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
