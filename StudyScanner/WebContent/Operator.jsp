<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>My Cafe</title>
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

.c_menu {
	color: #003399;
	text-align: right;
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

.searchBtn {
	border: 1px solid #003399;
	padding: 3px 15px 3px 15px;
	margin: 5px 5px 5px 5px;
	border-radius: 20px;
	background-color: white;
	color: #003399;
}

a {
	text-decoration: none;
	color: #003399;
}

.content {
	background: #003399;
	border-radius: 30px;
}

img {
	margin: 10px;
}

#star {
	float: left;
}

#book {
	float: right;
}

iframe {
	height: 100%;
	width: 45%;
}

.o {
	margin-legt: auto;
	margin-right: auto;
}

#dd {
	background-color: #003399;
	color: white;
	background-color: #003399;
	text-align: center;
	border: none;
	margin-bottom: 10px;
}
</style>
</head>
<body>

	<h1>
		<a href="index.html">STUDY SCANNER</a>
	</h1>

	<div class="content">
		<img src="logo_blue.png" align="center" height="40px" width="50px">
		<font color="white">문의하기</font>
	</div>
	<div class="o">
		<form action="Operator2.jsp">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="email" name="c_id" /></td>
				</tr>
				<tr>
					<td>문의내용</td>
					<td><textarea name="content" rows="10" cols="70"
							placeholder="로그인 활성화  요구,사진변경 신청 등"></textarea></td>
				</tr>
			</table>
			<input id="dd" type="submit" value="문의 등록" />
		</form>
	</div>
</body>
</html>