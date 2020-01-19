<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*,model.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
session=request.getSession();

String seatS = request.getParameter("seatS"); 
session.setAttribute("seatS", seatS); 
String s_id=(String)session.getAttribute("s_id");
ServletContext sc;
Connection conn;
sc = getServletContext();
conn= (Connection) sc.getAttribute("DBconnection");

int result=DBUtil.updateSeatStatus(conn, s_id,seatS);

if(result==0){
	out.println("<script>alert('업로드하였습니다.'); location.href='s_ManageSeat.jsp';</script>");
}
else if(result==1){
	out.println("<script>alert('업로드하였습니다.'); location.href='s_ManageSeat.jsp';</script>");
}
else {
	out.println("<script>alert('다시 업로드해주세요.'); location.href='s_ManageSeat.jsp';</script>");
}
response.setContentType("text/html; charset=UTF-8");
%>

</body>
</html>