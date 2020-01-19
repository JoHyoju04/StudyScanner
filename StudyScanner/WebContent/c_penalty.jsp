<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.util.ArrayList,java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약관리</title>
<style>
#title{
  
  background-color: #003399;
  color:white;
  
  }</style>
</head>
<body>
	<%
            request.setCharacterEncoding("UTF-8");
            String c_id=(String)session.getAttribute("c_id");
            ServletContext sc;
            Connection conn;
            sc = getServletContext();
            conn = (Connection) sc.getAttribute("DBconnection");
    
            System.out.println(c_id);
            ArrayList<Penalty> list = DBUtil.noshowList(conn, c_id);
            
            int count=DBUtil.lockStatus(conn, c_id);
            
           
            response.setContentType("text/html; charset=UTF-8");
         %>
         <div id="title">경고 현황 : <%=count%>회</div> 
         
            <table cellpadding="5" cellspacing="5" border="0">
               <tr>
                  <th width="16%">예약카페</th>
                  <th width="14%">예약날짜</th>
               </tr>
	       <%
                  for (Penalty p : list) {
               %>
               <tr align="center">
                  <td><%=p.getS_id()%></td>
                  <td><%=p.getRes_date()%></td>
               </tr>
               <%
                  }
               %></table>

</body>
</html>