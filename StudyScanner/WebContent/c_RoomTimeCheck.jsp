<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,model.*,java.io.PrintWriter,java.util.StringTokenizer,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String s_id=  (String) session.getAttribute("s_id");
		
		String r_date = (String)request.getParameter("cal");
		session.setAttribute("r_date",r_date);
		String roomName=(String)session.getAttribute("roomName");

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");
		
		ArrayList<timeList> time=DBUtil.roomTime(conn,s_id,roomName,r_date);
		
		response.setContentType("text/html; charset=UTF-8");
	%>
	<form method="post" action="c_RoomBook3.jsp">
		선택한 날짜 : <%=r_date %><br/>
		예약된 시간 : 
		<%
    for(timeList t : time){
    	%><%=" ("+t.getTimeList()+") "%>
    	<%
    }

%><br/>
		시작시간: <input type="number" name="r_sTime" /><br>
		 종료시간 : <input type="number" name="r_fTime" />
		
		<br /> <input type="submit" value="스터디룸예약"
			style="height: 30px; width: 100%; color: white; background-color: #003399; text-align: center; border: none; margin-top: 10px;">
	</form>
</body>
</html>