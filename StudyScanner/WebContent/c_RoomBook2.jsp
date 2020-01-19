<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
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

.c_menu {
	color: #003399;
	text-align: right;
}

h1 {
	text-align: center;
}

h2 {
	color: white;
	padding-left: 10px;
}
.content {
	background: #003399;
	border-radius: 30px;
}

.logo {
	margin: 10px;
}


.main {
    width: 90%;
    margin: 10px auto;
    display: flex;
	
}

.container {
	background-color: #003399;
	border-radius: 20px;
	text-color: #FFFFFF;
	width: 100%;
}

p {
	padding-left: 10px;
	text-align: center;
}

.info {
    margin: 10px;
	text-align:center;
	border: 2px solid gray;
	width:30%;
    box-sizing: border-box;
    flex:1;
}
.time{
    flex:1;
    margin: 0px 5%;
    width:30%;
    text-align:center;
    box-sizing: border-box;
    border: 2px solid gray;
    padding:10px;
}
.book{
    flex:1;
    width:30%;
    box-sizing: border-box;
    border: 2px solid gray;
    text-align:center;
}
.boundary {
	align: center;
	padding:3px;
	background: white;
	border-radius: 50px;
	border: 1px solid #003399;
	margin-top:30px;
	width: 100px;

}
.btn{
height: 30px;
 width: 100%; 
 color: white; 
 background-color: #003399; 
 text-align: center; 
 border: none; 
 
}
</style>
</head>
<body>
<%
  request.setCharacterEncoding("UTF-8");

   ServletContext sc;
	Connection conn;
	sc = getServletContext();
	session=request.getSession();
   conn= (Connection) sc.getAttribute("DBconnection");
   //System.out.println(name);
   String s_id=(String)session.getAttribute("s_id");
   String roomName=(String)request.getParameter("roomName");
   session.setAttribute("roomName",roomName);
   ArrayList<Room> room=DBUtil.RoomSelect(conn,s_id,roomName);
   

   
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
		<img src="logo_blue.png" align="center" width="50px" height="40px" class="logo"/>
		<font color="white">스터디룸 예약</font>
	</div>



	<div class="main">
	  <div class="info">
      
            <img src="<%=room.get(0).getRPhoto()%>" width="100%" /><br>
           <%=room.get(0).getRoomName()%><br>
           최대 수용 인원 : <%=room.get(0).getRoomPersonNum() %><br>
           <%=room.get(0).getRoomPrice()%><br>
      </div>
	  
      
     <div class="time">
     <font class="boundary">예약날짜 선택</font><br><br>
       <form method="post" action="c_RoomTimeCheck.jsp">
                       예약날짜 : <input type="date" name="cal">  <br><br>
			
			<p style="color: red">
				* 예약하고 가지 않는 경우 경고 1번 추가 <br> * 경고 3번이 되면 일주일동안 예약을 할 수 없습니다.
			</p>
			<input type="submit" class="btn" formtarget="time" value="가능시간 확인하기" /> <br />
       </form>
			
     </div>
     
     
     <div class="book">
      <iframe src="" width="100%" height="100%" name="time" seamless></iframe>
     </div>
     



	</div>
</body>
</html>