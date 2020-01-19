<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>카페등록</title>
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

.boundary {
	background: white;
	border-radius: 50px;
	border: 3px solid #003399;
}

.btn {
	margin: 20px;
	float: right;
	background-color: #003399;
	border-radius: 30px;
	border: 2px solid #003399;
	color: white;
	font-size: 20px;
	padding: 7px 50px;
}

p {
	color: white;
}
.content {
	background: #003399;
	border-radius: 30px;
}

img {
	margin: 10px;
}

.menu {
	overflow-x: auto;
	margin: 40px;
	text-align: center;
	align: center;
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
		<font color="white">카페 등록</font>
	</div>
	<div class="menu" style="text-align: center;">
		<form method="post" action="cafeRegister" enctype="multipart/form-data">
			<table align="center">
				<tr>
					<td align="center" width="200" height="30" class="boundary">매장
						전화번호</td>
					<td align="left" width="300">&emsp;
					<input type="text" name="s_tel"
						align="right" width="400"></td>
				</tr>
				</tr>
				<tr>
					<td><br>
					<br></td>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td><br>
					<br></td>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td align="center" width="200" height="30" class="boundary">사진</td>
					<td align="left" height="30">&emsp;<input type="file" name="s_photo1"><br>

					</td>
				</tr>
				<tr>
					<td></td>
					<td align="left" height="30">&emsp;<input type="file" name="s_photo2"><br>

					</td>
				</tr>
				<tr>
					<td></td>
					<td align="left" height="30">&emsp;<input type="file" name="s_photo3"><br>

					</td>
				</tr>
				<tr>
					<td><br>
					<br></td>
					<td><br>
					<br></td>
				</tr>
				<tr>
					<td align="center" width="200" height="30" class="boundary">운영시간</td>
					<td align="left" width="300">&emsp;<input type="text" name="s_time"
						align="right" width="400" placeholder="매일 00:00 ~ 24:00"></td>
				</tr>
				</tr>
				<tr>
					<td><br>
					<br></td>
					<td><br>
					<br></td>
				</tr>
				
				
				<tr>
					<td align="center" width="200" height="30" class="boundary">이용요금
					</td>
					<td align="left" width="300">&emsp; 
				
					</td>
				</tr>
				<caption></caption>
				
			</table>
			<br>
			<textarea name="s_price"
							rows="10" cols="70" placeholder="예시)&#10;일반 스터디 공간 2시간 : 3,500원 &#10;4시간 : 5,000원&#10;6시간 : 7,000원 &#10;12시간 : 11,000원&#10;스터디 룸 아마존 룸 : 1시간당 4,000원"></textarea>
							<br>

            <input type="submit" value="카페등록" class="btn"
               style="height: 30px; width: 500px; color: white; background-color: #003399; text-align: center; border: none; margin-top: 10px; align:center;">

		</form>
	</div>




</body>
</html>