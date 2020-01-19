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
.s_menu{
 color:#003399;
 text-align: right;
}

.container { //
	text-align: center;
}

.container {
	margin: 20px;
	height: 700px;
	border: 1px #FFFFFF;
}

button {
	border: 2px solid #003399;
	padding: 5px 15px 5px 15px;
	margin: 5px 5px 5px 5px;
	border-radius: 20px;
	background-color: white;
	color: #003399;
}

.nSearch {
	border-top: none;
	border-left: none;
	border-right: none;
	border-bottom: 1px solid #003399;
	width: 300px;
	height: 30px;
	font-size: 20px;
}

.form {
	text-align: center;
}

.searchBtn {
	border: 1px solid #003399;
	padding: 5px 20px 5px 20px;
	margin: 5px 5px 5px 5px;
	border-radius: 20px;
	background-color: #003399;
	color: white;
}

table {
	border-collapse: collapse;
	margin-top: 50px;
}

th, td {
	border: 1px solid #003399;
	border-collapse: collapse;
}
</style>
</head>
<body>
	<div class="s_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="s_Modify.jsp">마이페이지</a>
	</div>



	<h1>
		<a href="index.html"> STUDY SCANNER</a>
	</h1>
	<hr color=#003399>
	<div class="container">
		<button type="button" onclick="location.href='s_Seat.jsp' ">좌석관리</button>
		<div class="form">
			<form class="nameSearch" action="doNameSearch" method="post">
				<input type="text" class="nSearch" name="name_search"
					value="예약자의 이름을 입력하세요." /> <input type="submit" class="searchBtn"
					value="검색" />
			</form>
		</div>
		<div class="book">
			<table frame="void" style="width: 100%">
				<tr>
					<th>이름</th>
					<th>이메일</th>
					<th>예약시간</th>
					<th>도착예정</th>
					<th>예약좌석</th>
					<th>확인/취소</th>
				</tr>
				<tr>
					<td>d</td>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
					<th></th>
				</tr>

			</table>
		</div>


	</div>
	</div>



</body>
</html>