<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript">
function roomBook(name) {
	var roomName=document.getElementById(name.id).id;
	window.location.replace("c_RoomBook2.jsp?roomName=" + roomName);

 }

</script>
<title>Insert title here</title>
<style type="text/css">
.c_menu {
	color: #003399;
	text-align: right;
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

h1 {
	text-align: center;
}

.content {
	background: #003399;
	border-radius: 30px;
}

.logo{
	margin: 10px;
}

p {
	padding-left: 20px;
}

h2 {
	color: white;
	padding-left: 10px;
}

.container {
	background-color: #003399;
	border-radius: 20px;
}

.main {
    margin: 10px;
	text-align:center;
	border: 2px solid gray;
	width:30%;
    box-sizing: border-box;
    flex:1;
}
.btn{
    align: center;
	background: white;
	border-radius: 50px;
	border: 1px solid #003399;
	padding: 5px;
	margin-bottom: 5px;
	margin-top: 5px;
	width: 100px;
}
.parent{
    width: 90%;
    margin: 10px auto;
    display: flex;
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

   String s_id=(String)session.getAttribute("s_id");
   ArrayList<Room> room=DBUtil.RoomBook(conn,s_id);
   

   response.setContentType("text/html; charset=UTF-8");
%>
	<div class="c_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
			href="c_MyCafe.jsp">My카페</a>
	</div>

	<h1>
		<a href="index.html">STUDY SCANNER</a>
	</h1>
	<div class="content">
		<img src="logo_blue.png" align="center" width="50px" height="40px" class="logo" />
		<font color="white">스터디룸 예약</font>
	</div>

    <div class="parent">
    <%


    for(Room r : room){


    %>
     <div class="main">
     <img src="<%=r.getRPhoto()%>" width="100%" /> <br>
	        <%=r.getRoomName()%><br>
	        최대 수용 인원 : <%=r.getRoomPersonNum() %><br>
	        <%=r.getRoomPrice()%><br>
	        <button id="<%=r.getRoomName()%>"onclick="roomBook(this)" class="btn">예약하기</button>
     </div>
            
 <%

    }

%>
    </div>
	
	
	        
</body>
</html>