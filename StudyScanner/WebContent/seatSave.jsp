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
		String[] arrNumber = new String[10];

		arrNumber = (String[]) request.getParameterValues("arrNumber");
		
		

		int i = 0;

		String[] sp = arrNumber[0].split(",");
		
		String s_id = (String) session.getAttribute("s_id");
	
		for (int j = 0; j < 100; j++) {
			if(sp[j].equals("1")){
			ServletContext sc = getServletContext();
			Connection conn = (Connection) sc.getAttribute("DBconnection");
			System.out.println(sp[j]);
			DBUtil.createSeat(conn, s_id, j,0);}
		}

		
		response.setContentType("text/html; charset=UTF-8");

		out.println("<script> location.href='s_Choice.jsp';</script>");
		out.flush();
	%>
</body>
</html>