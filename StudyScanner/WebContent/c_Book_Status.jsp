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
<style>
 table {
    width: 100%;
    border-top: 1px solid  #003399;;
    border-collapse: collapse;
  }
  th, td {
    border-bottom: 1px solid #003399;;
    padding: 10px;
  }
  #title{
  
  background-color: #003399;
  color:white;
  
  }
</style>
</head>
<body>
	<div id="title">좌석 예약 현황</div>


	<%
		request.setCharacterEncoding("UTF-8");
		ServletContext sc;
		Connection conn;
		String result;
		//String rs;
		sc = getServletContext();
		conn = (Connection) sc.getAttribute("DBconnection");
		session = request.getSession();
		String c_id = (String) session.getAttribute("c_id");
	%>
	<%
		ArrayList<SeatBook> seatbook = DBUtil.searchBook(conn, c_id);
	%>
<table cellpadding="5" cellspacing="5" border="1">
<tr>
               <th width="10%">카페</th>
               <th width="15%">좌석 번호</th>
               <th width="20%">예약 날짜</th>
               <th width="20%">시작 시간</th>
               <th width="20%">종료 시간</th>
            </tr>
	<%
		for (SeatBook sb : seatbook) {
	%>
	<% String search_name = sb.getS_id();
	String cafename=(String)DBUtil.searchCafeName(conn,search_name);%>
	
            

	<tr align="center">
		<td><%=cafename%></td>
		<td><%=sb.getSeati()%></td>
		<td><%=sb.getDate()%></td>
		<td><%=sb.getStime()%></td>
		<td><%=sb.getFtime()%></td>
	</tr>


	<%
		}
	%> </table>
	<div id="title">스터디룸 예약 현황</div>


	<%
		ArrayList<RoomBook> roombook = DBUtil.searchRoomBook(conn, c_id);
	%>
<table cellpadding="5" cellspacing="5" border="1">
<tr>
               <th width="10%">카페</th>
               <th width="15%">방 이름</th>
               <th width="20%">예약 날짜</th>
               <th width="20%">시작 시간</th>
               <th width="20%">종료 시간</th>
            </tr>
	<%
		for (RoomBook rb : roombook) {
	%>
	<% String search_name = rb.getS_id();
	String cafename=(String)DBUtil.searchCafeName(conn,search_name);%>
	
            

	<tr align="center">
		<td><%=cafename%></td>
		<td><%=rb.getRoomName()%></td>
		<td><%=rb.getDate()%></td>
		<td><%=rb.getStime()%></td>
		<td><%=rb.getFtime()%></td>
	</tr>


	<%
		}
	%> </table>
	
	



</body>
</html>