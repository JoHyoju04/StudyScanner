<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,model.*,java.io.PrintWriter,java.util.StringTokenizer,java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		session = request.getSession();
		request.setCharacterEncoding("UTF-8");
		String s_id=  (String) session.getAttribute("s_id");
		String seati = (String) session.getAttribute("seatS");
		String date = request.getParameter("res_date");
		session.setAttribute("date",date);

		ServletContext sc = getServletContext();
		Connection conn = (Connection) sc.getAttribute("DBconnection");

		ArrayList <timeList> list=DBUtil.seatTimeCheck(conn, s_id, seati, date);
		response.setContentType("text/html; charset=UTF-8");
	%>
	<form method="post" action="TimeTable.jsp">
		예약 좌석 :<%=session.getAttribute("seatS") %><br /> 
		
		선택한 날짜 : <%=date %><br/>
		예약된 시간 : <%for(timeList tlist :list ){%> <%="("+tlist.getTimeList()+")"%><%} %></br>
		시작시간: <input type="number" name="res_stime" /> 종료시간 : <input
			type="number" name="res_ftime" />
		
		<br /> <input type="submit" value="좌석예약"
			style="height: 30px; width: 500px; color: white; background-color: #003399; text-align: center; border: none; margin-top: 10px;">
	</form>
</body>
</html>