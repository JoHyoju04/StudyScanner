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
      String c_id = (String) session.getAttribute("c_id");
      String c_passwd = (String) request.getParameter("c_passwd");
      String c_name = (String) request.getParameter("c_name");
      String c_phone = (String) request.getParameter("c_phone");

      Connection conn = (Connection) sc.getAttribute("DBconnection");

      // sString c_id=(String)session.getAttribute("c_id");
      int result = DBUtil.cModifyInfo(conn, c_id, c_passwd, c_name, c_phone);
      response.setContentType("text/html; charset=UTF-8");
      if (result==0) {
    	  out.println("<script>alert('수정되지 않았습니다.'); location.href='c_Search.jsp';</script>");
      } else {
         out.println("<script>alert('수정되었습니다.'); location.href='c_Search.jsp';</script>");
      } %>
</body>
</html>