<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
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
	margin: 20px;
	height: 700px;
	border: 1px #FFFFFF;
	text-align: center;
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
	margin-bottom: 10px;
}
.main{
   width:100%;
   align : center;
   margin-left: 20px;
   margin-right: 20px;
   margin-top:30px;

}
.right{
   width: 48%;
   height: 60%;
   float: left;
   margin: 10px;

}
.left{
   width: 48%;
   float: left;
   margin: 10px;


}
.content {
   background: #003399;
	border-radius: 30px;
	margin-bottom: 20px;
}
.btn{
   margin-top: 40px;
   height: 30%;

}
.logo {
	margin: 10px;
}



</style>
</head>
<body>
<%
request.setCharacterEncoding("UTF-8");
String cafename = request.getParameter("cafename");

   ServletContext sc;
	Connection conn;

	sc = getServletContext();
	session=request.getSession();
   conn= (Connection) sc.getAttribute("DBconnection");

   ArrayList<StudyCafe> cafe=DBUtil.sarchResultCafe(conn, cafename);
   

   session.setAttribute("s_id",cafe.get(0).getS_id());
   String name=(String)session.getAttribute("s_id"); //카페 아이디

   response.setContentType("text/html; charset=UTF-8");

%>

	<div class="c_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
			href="c_MyCafe.jsp">My카페</a>
	</div>

	<h1>
		<a href="c_Search.jsp">STUDY SCANNER</a>

	</h1>

   <div class="content">
      <img src="logo_blue.png" align="center" width="50px" height="40px" class="logo" />
      <font color="white"><%=cafename %></font>
   </div>
	
	<div class="main">
	<div class="left">
	
	<%


    for(StudyCafe c : cafe){


    %>
		
			<p>주소: <%=c.getAddress() %></p>
			
			<hr><br>
			<p>전화번호: <%=c.getAddress() %></p>
			
			<hr><br>
			<p>이용시간: <%=c.getTime() %></p>
		
			<hr><br>
			<p>스터디카페 사진 </p>
		
			<img src="<%=c.getPhoto1()%>" width="30%" />


<img src="<%=c.getPhoto2()%>" width="30%" /> 


<img src="<%=c.getPhoto3() %>" width="30%" />
	


		
			

	</div>
	<div class="right">
	<p>이용요금</p>
	<hr>
	<%=c.getPrice().replace("\r\n","<br>")%>
	
	<%


    }


%>




<div class="btn">

	<input
               type="submit" value="좌석현황 & 예약" 
               onclick="location.href='c_SeatBook1.jsp'"
               style=" width: 45%; color: black; background-color: #B2CCFF; text-align: center; border: none; margin-top: 10px;">
               
    <input
               type="submit" value="스터디룸 예약" onclick="location.href='c_RoomBook1.jsp'"
               style=" width: 45%; color: black; background-color: #B2CCFF; text-align: center; border: none; margin-top: 10px;">
	

	
</div>
	
	

	</div>
	


</body>

</html>