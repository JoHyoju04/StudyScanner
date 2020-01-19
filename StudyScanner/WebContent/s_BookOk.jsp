<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.io.PrintWriter,javax.servlet.*,java.util.ArrayList" %>
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
      PreparedStatement pstmt=null;
      String id = request.getParameter("c_id");  
      String seati= request.getParameter("Seati");
      String date=request.getParameter("date");
      int n=0;
      try{
         
      
      sc = getServletContext();
      conn = (Connection) sc.getAttribute("DBconnection");
      String sqlSt = "DELETE FROM time_table WHERE c_id=? AND seati=? AND res_date=?";
      pstmt=conn.prepareStatement(sqlSt);
      pstmt.setString(1,id);
      pstmt.setString(2,seati);
      pstmt.setString(3,date);
      n= pstmt.executeUpdate();
      
      }catch (SQLException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }
      
      response.sendRedirect("s_BookInfo.jsp");
      
      
      //String c_id = DBUtil.c_IDsearch(conn, c_name, phoneNum);
       //System.out.print(cafeName);
      
   %>
   
</body>
</html>