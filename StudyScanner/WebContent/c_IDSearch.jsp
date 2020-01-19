<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.io.PrintWriter,javax.servlet.*"%>
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
		String c_name= request.getParameter("c_name");
		String phoneNum = request.getParameter("phoneNum");
		String c_id = DBUtil.c_IDsearch(conn, c_name, phoneNum);
		 
		
	%>
	<%
		if (c_id == null) {
	%>
	<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
	<%
		} else {
	%>
	<script type="text/javascript">alert("찾으시는 계정은  <%=c_id%> 입니다.");
		location.href = "c_Login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>