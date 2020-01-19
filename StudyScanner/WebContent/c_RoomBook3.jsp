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

	<%	
		
		session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String s_id = (String) session.getAttribute("s_id");
		String c_id = (String) session.getAttribute("c_id");
		String roomName=(String)session.getAttribute("roomName");
		int r_sTime = Integer.parseInt(request.getParameter("r_sTime"));
		int r_fTime = Integer.parseInt(request.getParameter("r_fTime"));
		String r_date=(String)session.getAttribute("r_date");
		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		
	    String result= DBUtil.roomResult(conn, s_id, c_id, r_date,r_sTime,r_fTime, roomName);
		

		response.setContentType("text/html; charset=UTF-8");
	%>
	
	<script>alert("<%=result%>");</script>
	
</body>
</html>