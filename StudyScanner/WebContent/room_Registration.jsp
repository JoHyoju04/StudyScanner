<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>스터디룸 등록</title>

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

.menu {
	margin: 50px;
	padding: 10px;
	align: center;
	display: inline;
	min-width: 100%;
	text-align:center;
}

.cafename {
	background-color: #003399;
	text-align: center;
	color: white;
	width: 200px;
	height: 50px;
	margin: 20px;
	height: 50px;
}

input {
	height: 25px;
	margin-right: 5px;
}

.abc {
	text-align: center;
}

.boundary {
	align: center;
	background: white;
	border-radius: 50px;
	border: 1px solid #003399;
	padding: 5px;
	margin-right: 10px;
	width: 100px;
	margin-left: 15px;
}

.btn {
	margin: 20px;
	float: right;
	background-color: white;
	border-radius: 30px;
	border: 2px solid #003399;
	color: black;
}
.upload{
    margin-left: 25px;
	background-color: white;
	border-radius: 30px;
	border: 2px solid #003399;
	color: black;
	text-align:center;
}

.content {
	background: #003399;
	border-radius: 30px;
}

img {
	margin: 10px;
}

p {
	color: white;
}
.s_menu{
  color: #003399;
  text-align: right;
}
</style>
</head>
<body>
<div class="s_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="s_Modify.jsp">마이페이지</a>
	</div>
	<h1>
		<a href="s_Choice.jsp">STUDY SCANNER</a>
	</h1>
	<div class="content">
		<img src="logo_blue.png" align="center" height="40px" width="50px">
		<font color="white">스터디룸 등록</font>
	</div>
	<div class="menu">
			<div class="abc">
			
			<form method="post" action="roomRegister" enctype="multipart/form-data">
			<font class="boundary">방 이름</font><input type="text" name="s_roomName" > 
			<font class="boundary">가격</font><input type="text" placeholder="시간당 0000원" name="s_roomPrice">
				<select name="s_roomPersonNumber">
					<option value="selector" disabled>최대 수용 인원</option>
					<option value="2">2명</option>
					<option value="4">4명</option>
					<option value="6">6명</option>
					<option value="8">8명</option>
				</select>
				<font class="boundary">스터디룸 사진</font><input type="file" name="s_RPhoto">
				<input type="submit" class="upload" value="업로드 하기"/>
			</form>
				
			</div>
			<br> <br>
			<p style="color: red">
				* 스터디룸 최소3번 등록가능합니다.
			</p>
			<br> <br>
			
		</form>
		<input type="button" class="btn" onclick="location.href='s_Choice.jsp'" value="완료"/>

	</div>

</body>
</html>
