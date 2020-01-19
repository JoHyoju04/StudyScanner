<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
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

h1 {
	text-align: center;
}

.s_menu {
	color: #003399;
	text-align: right;
}

.container {
	text-align: center;
	margin: 20px;
	height: 700px;
	border: 1px #FFFFFF;
	background-image: url( "cafe.jpg" );
	background-repeat: no-repeat;
	background-position: center;
	opacity: 0.8;
}


button {
	text-align: center;
	border-radius: 12px;
	background-color: transparent;
	color: #ffffff;
	height: 30px;
	width: 150px;
	border: 2px solid #ffffff;;
	margin-bottom: 10px;
}

p {
	color: white;
	text-size: 20px;
}
</style>
</head>
<body>
	<div class="s_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="s_Modify.jsp">정보 수정</a>
	</div>


	<h1>
		<a class="MaIn" href="s_Choice.jsp"> STUDY SCANNER </a>
	</h1>
	<hr color=#003399>

	<div class="container">
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<br>
		<p>STUDY SCANNER</p>
		<p>스터디 카페를 예약하는 사이트</p>
		<button type="button" onclick="location.href='cafe_Registration.jsp' ">카페정보 등록</button>
		<br>
		<button type="button" onclick="location.href='room_Registration.jsp' ">스터디룸 등록</button>
		<br>
		<button type="button" onclick="location.href='seat_Registration.jsp' ">카페좌석 등록</button>
		<br>
		<button type="button" onclick="location.href='s_ManageSeat.jsp' ">카페
			관리</button>
	</div>



</body>
</html>