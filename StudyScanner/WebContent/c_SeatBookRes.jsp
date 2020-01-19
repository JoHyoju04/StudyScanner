<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
</script>
</head>
<body>
 
 <% String seatS = request.getParameter("seatS"); %>
 <% session.setAttribute("seatS", seatS); %>

	<form method="post" action="timeTableCheck.jsp">
		
		예약 좌석 :
		<%=seatS %><br />
		 예약 날짜: <input type="date" name="res_date">
		<input type="submit" value="시간 확인"></input>
		
		<br /> 
	</form>
</body>
</html>