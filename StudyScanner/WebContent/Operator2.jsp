<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
		request.setCharacterEncoding("UTF-8");
		ServletContext sc;
		Connection conn;
		sc = getServletContext();
		conn = (Connection) sc.getAttribute("DBconnection");
	String c_id=request.getParameter("c_id");
	String content=request.getParameter("content");
	
	DBUtil.askContent(conn,c_id,content);
	%>
	<%out.println("<script> location.href='index.html';</script>"); %>

</body>
</html>