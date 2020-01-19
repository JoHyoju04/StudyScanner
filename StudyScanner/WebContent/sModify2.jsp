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
 <%		session = request.getSession();
      ServletContext sc = getServletContext();
      String s_id = (String) session.getAttribute("s_id");
      String s_passwd = (String) request.getParameter("s_passwd");
      String s_cafeName = (String) request.getParameter("s_cafeName");
      String s_address = (String) request.getParameter("s_address");

      Connection conn = (Connection) sc.getAttribute("DBconnection");

      int result = DBUtil.sModifyInfo(conn, s_id, s_passwd, s_cafeName, s_address);
      response.setContentType("text/html; charset=UTF-8");
      if (result==0) {
    	  out.println("<script>alert('수정되지 않았습니다.'); location.href='s_Choice.jsp';</script>");
      } else {
         out.println("<script>alert('수정되었습니다.'); location.href='s_Choice.jsp';</script>");
      } %>
</body>
</html>