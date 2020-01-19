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
		String cafeName = request.getParameter("cafeName");
		String address = request.getParameter("address");
		String s_id = DBUtil.s_IDsearch(conn, cafeName, address);
		 System.out.print(cafeName);
		
	%>
	<%
		if (s_id == null) {
	%>
	<script type="text/javascript">
alert("존재하지 않은 계정입니다");
history.go(-1);
</script>
	<%
		} else {
	%>
	<script type="text/javascript">alert("찾으시는 계정은  <%=s_id%> 입니다.");
		location.href = "s_Login.jsp";
	</script>
	<%
		}
	%>
</body>
</html>