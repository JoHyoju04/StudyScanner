<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">


<title>예약관리</title>

<style type="text/css">
h1 {
   text-align: center;
}

.container {
   text-align: center;
}

a:link {
   color: black;
   text-decoration: none;
}

a:visited {
   color: black;
   text-decoration: none;
}

a:hover {
   color: black;
   text-decoration: none;
}

a:active {
   color: black;
   text-decoration: none;
}

.container {
   text-align: center;
   margin: 20px;
   height: 700px;
   border: 1px #FFFFFF;
}

button {
   border: 2px solid #003399;
   padding: 5px 15px 5px 15px;
   margin: 5px 5px 5px 5px;
   border-radius: 20px;
   background-color: white;
   color: #003399;
}

.cSearch {
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: 1px solid #003399;
   width: 250px;
}

.form {
   text-align: center;
}

.searchBtn {
   border: 1px solid #003399;
   padding: 3px 15px 3px 15px;
   margin: 5px 5px 5px 5px;
   border-radius: 20px;
   background-color: white;
   color: #003399;
}

.c_menu {
   color: #003399;
   text-align: right;
}

img {
     margin: 10px;
}

.main {
   width: 100%;
   align: center;
   margin-left: 5px;
   margin-right: 20px;
   margin-top: 30px;
}

.right {
   width: 48%;
   height: 60%;
   float: left;
   margin: 10px;
}

.left {
   width: 48%;
   float: left;
   margin: 10px;
}

.content {
   background: #003399;
   border-radius: 30px;
}

.btn {
   margin-top: 40px;
   height: 30%;
}

table {
   width: 100%
}

th {
   background-color: #D9E5FF;
   height: "100px";
}
</style>

</head>
<body>


   <div class="c_menu">
      <a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a>
   </div>

   <h1>
      <a href="s_Choice.jsp">STUDY SCANNER</a>

   </h1>

   <div class="content">
      <img src="logo_blue.png" align="center" height="40px" width="50px">
      <font color="white">예약 관리</font>
   </div>
   <div class="container">
   
   
      
         
         <%
            request.setCharacterEncoding("UTF-8");
            String s_id=(String)session.getAttribute("s_id");
            ServletContext sc;
            Connection conn;
            sc = getServletContext();
            conn = (Connection) sc.getAttribute("DBconnection");
    
            //System.out.println(name);
            ArrayList<BookInfo> list = DBUtil.resultBook(conn,s_id);
            //int size = list.size();
            //String s_id = (String) session.getAttribute("s_id");
            //System.out.println(id);

            response.setContentType("text/html; charset=UTF-8");
         %>
         <div class="main">
            <table cellpadding="5" cellspacing="5" border="0">
               <tr>
                  <th width="16%">예약회원</th>
                  <th width="10%">예약좌석</th>
                  <th width="14%">예약날짜</th>
                  <th width="12%">예약시작시간</th>
                  <th width="12%">예약종료시간</th>
                  <th width="9%">확인</th>
                  <th width="9%">패널티</th>


               </tr>

               <%
                  for (BookInfo b : list) {
               %>

               <tr align="center">
                  <td><%=b.getC_id()%></td>
                  <td><%=b.getSeati()%></td>
                  <td><%=b.getRes_date()%></td>
                  <td><%=b.getRes_stime()%></td>
                  <td><%=b.getRes_ftime()%></td>
                  <td>
                     <!-- <button onclick="javascript:ok()">clear</button> -->
                     <a href="s_BookOk.jsp?c_id=<%=b.getC_id()%>+&Seati=<%=b.getSeati()%>+&date=<%=b.getRes_date()%>>">확인</a>
                  </td>
                  <td>
                     <!-- <button onclick="javascript:cancel()">cancel</button> -->
                     
                     <a href="Delete.jsp?c_id=<%=b.getC_id()%>+&Seati=<%=b.getSeati()%>+&res_date=<%=b.getRes_date() %>">경고</a>
                  </td>
                 <% System.out.println("s_bookinfo에서"+b.getC_id());%>
                 

               </tr>



               <%
                  }
               %>

            </table>
         </div>


      </div>
</body>

</html>