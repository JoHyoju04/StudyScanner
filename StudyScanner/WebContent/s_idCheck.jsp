<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.Connection,model.DBUtil,java.io.PrintWriter" %>

<%
		String s_id = (String) request.getParameter("s_id");
		ServletContext sc = getServletContext();
		Connection conn= (Connection) sc.getAttribute("DBconnection");
		
		int rs=DBUtil.CheckSUser(conn, s_id);
		
		if (rs== 1) {
			out.println("<script>alert('중복된 아이디입니다.');</script>");
		}
		else {
			out.println("<script>alert('사용가능한 아이디입니다.');</script>");
		}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>


</body>
</html>