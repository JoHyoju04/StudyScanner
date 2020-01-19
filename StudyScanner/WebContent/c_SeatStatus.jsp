<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
h1 {
	text-align: center;
}
.c_menu{
  color: #003399;
  text-align: right;
}
a:link            {color:black; text-decoration:none;} 
a:visited        {color:black; text-decoration:none;}
a:hover        {color:black;   text-decoration:none; }
a:active        {color:black; text-decoration:none;}


.status {
	border: 2px solid #E5F1F7;
	background-color: #E5F1F7;
	width: 500px;
	padding: 5px;
	margin: 5px;
}

.empty {
	border: 2px solid #D5D5D5;
	padding: 5px;
	margin: 5px;
	width: 180px;
	border-radius: 20px;
	background-color: #D5D5D5;
	margin: 5px;
}

.use {
	border: 2px solid #B2CCFF;
	padding: 5px;
	margin: 5px;
	width: 180px;
	border-radius: 20px;
	background-color: #B2CCFF;
}

.book {
	border: 2px solid #4375DB;
	padding: 5px;
	margin: 5px;
	width: 180px;
	border-radius: 20px;
	background-color: #4375DB;
}

.main {
	width: 70%;
	height: 100%;
	float: left;
	margin-top: 20px;
}

.right {
	width: 30%;
	float: right;
	height: 100%;
	margin-top: 20px;
}
</style>
</head>
<body>
	<div class="c_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
			href="c_MyCafe.jsp">My카페</a>
	</div>


	<h1><a href="c_Search.jsp">STUDY SCANNER</a></h1>
	<hr color=#003399>

	<div class="container">
		<font class="status" size="4px">좌석 현황</font> <font class="empty"
			size="2px">비어 있는 좌석</font> <font class="use" size="2px">사용 중인
			좌석</font> <font class="book" size="2px">예약된 좌석</font>
	</div>

	<div class="main">
		<iframe src="b.jsp" width="600" height="500"></iframe>
	</div>
	<div class="right">
		<iframe src="a.jsp" width="200" height="250">
			<p>
				잔여좌석: <br /> 사용좌석: <br /> 예약좌석:
			</p>
		</iframe>
		<br /> <input type="button" value="예약 좌석 선택" /> <br />
		<p style="color: red">
			* 예약하고 가지 않는 경우 경고 1번 추가 <br> * 경고 3번이 되면 일주일동안 예약을 할 수 없습니다.
		</p>
	</div>
</body>
</html>