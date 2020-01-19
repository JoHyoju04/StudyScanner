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
		String c_id = request.getParameter("c_id");
		String c_name = request.getParameter("c_name");
		String phoneNum = request.getParameter("phoneNum");
		String c_passwd = DBUtil.c_PWsearch(conn, c_id, c_name, phoneNum);
		 //System.out.print(cafeName);
		
	%>
	<%
		if (c_passwd == null) {
	%>
	<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
	<%
		} else {
	%>
	<script type="text/javascript">alert("찾으시는 비밀번호는  <%=c_passwd%> 입니다.");
		location.href = "s_Login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>