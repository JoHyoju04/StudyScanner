<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">
<title>사용자 정보수정</title>
<style type="text/css">
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

h1 {
   text-align: center;
}

hr {
   width: 80%
}

img {
   width: 50px;
}

table {
   font-size: 20px;
}

.c_menu {
   color: #003399;
   text-align: right;
}

.menu {
   margin: 30px;
   text-align: center;
   align: center;
}

.boundary {
   background: white;
   border-radius: 30px;
   border: 3px solid #003399;
}

.btn {
   background-color: white;
   border-radius: 30px;
   border: 2px solid #003399;
   color: black;
   font-size: 20px;
   padding: 7px 50px;
}

.noborder {
   border: 0px;
   background: white;
}

.content {
   background: #003399;
   border-radius: 30px;
}

img {
   margin: 10px;
}
</style>
</head>
<body>
   <div class="c_menu">
      <a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
         href="c_MyCafe.jsp">My카페</a>
   </div>
   

   <h1>
      <a class="MaIn" href="c_Search.jsp">STUDY SCANNER</a>
   </h1>

   <div class="content">
      <img src="logo_blue.png" align="center" height="40px" width="50px">
      <font color="white">회원 정보 수정</font>
   </div>
  
   
   <%
   	session = request.getSession();
            request.setCharacterEncoding("UTF-8");
            ServletContext sc;
            Connection conn;
            sc = getServletContext();
            conn = (Connection) sc.getAttribute("DBconnection");
            String c_id=(String)session.getAttribute("c_id");

            ArrayList<Modify> list = DBUtil.cModify(conn, c_id);
          
      
            response.setContentType("text/html; charset=UTF-8");
            for(Modify m : list){
            %>
   <div class="menu">
      <table align="center">
         <tr>
            <td align="left" width="200">&emsp; 아이디</td>
            <td width="250" height="40" class="boundary"><%=m.getC_id() %></td>
         </tr>
      </table>
      <br>
      <hr>
      <br>
      <table align="center">
         <tr>
            <td align="left" width="200">&emsp; 비밀번호</td>
            <td width="250" height="40" class="boundary"><%=m.getC_passwd() %></td>
         </tr>
      </table>
      <br>
      <hr>
      <br>
      <table align="center">
         <tr>
            <td align="left" width="200">&emsp; 이름</td>
            <td width="250" height="40" class="boundary"><%=m.getC_name() %></td>
         </tr>
      </table>
      <br>
      <hr>
      <br>
      <table align="center">
         <tr>
            <td align="left" width="200">&emsp; 휴대전화</td>
            <td width="250" height="40" class="boundary"><%=m.getC_phone() %></td>
         </tr>
      </table>
         <%
    }
%>
      <br>
   </div>

   
   <p align="center">
     
      <button onclick="location.href='cModifyAct.jsp'" class="btn">수정하기</button>
   </p>
   
</body>
</html>