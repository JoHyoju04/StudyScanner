<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,model.DBUtil,java.io.PrintWriter,java.util.StringTokenizer"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<% session=request.getSession();
String time= (String)session.getAttribute("time");
%>

	<%	
		
		session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String s_id = (String) session.getAttribute("s_id");
		String c_id = (String) session.getAttribute("c_id");
		String seati = (String) session.getAttribute("seatS");
		String date = (String)session.getAttribute("date");
		int stime = Integer.parseInt(request.getParameter("res_stime"));
		int ftime = Integer.parseInt(request.getParameter("res_ftime"));
		
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		
		
	    String result= DBUtil.bookTime(conn, s_id, c_id, seati, date, stime, ftime);
		
		System.out.println(result);
		

		response.setContentType("text/html; charset=UTF-8");
	%>
	<%=result%>
	
</body>
</html>