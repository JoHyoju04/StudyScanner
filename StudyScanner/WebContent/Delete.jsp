<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page
	import="java.sql.Connection,model.DBUtil,java.io.PrintWriter,java.util.StringTokenizer"%>
	<%@ page import="java.sql.*,model.*,java.io.PrintWriter,javax.servlet.*,java.util.ArrayList" %>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%		
		session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		
		
		String c_id = (String) request.getParameter("c_id");
		System.out.println(c_id+"delete창에서");
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
	    DBUtil.penalty(conn, c_id);

		response.setContentType("text/html; charset=UTF-8");
		out.println("<script>alert('완료되었습니다.'); location.href='s_BookInfo.jsp';</script>");
		
		String s_id = (String) session.getAttribute("s_id");
		//String cc_id = c_id;
		String res_date = (String) request.getParameter("res_date");
		String r_date = (String)request.getParameter("r_date");
		String seati= request.getParameter("Seati");
		
		DBUtil.penaltyState(conn, s_id, c_id, res_date);
		
		
		PreparedStatement pstmt2=null;
		int n=0;
		sc = getServletContext();
	      conn = (Connection) sc.getAttribute("DBconnection");
	      String sqlSt2 = "DELETE FROM time_table WHERE c_id=? AND seati=? AND res_date=?";
	      pstmt2=conn.prepareStatement(sqlSt2);
	      pstmt2.setString(1,c_id);
	      pstmt2.setString(2,seati);
	      pstmt2.setString(3,res_date);
	      n= pstmt2.executeUpdate();
		
		response.setContentType("text/html; charset=UTF-8");
	%>

</body>
</html>