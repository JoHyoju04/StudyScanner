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
</style>
</head>
<body>
	<div class="c_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
			href="c_MyCafe.jsp">My카페</a>
	</div>

	<h1>
		<a href="c_Search.jsp">STUDY SCANNER</a>
	</h1>
	<div class="content">
		<img src="logo_blue.png" align="center" width="50px" height="40px" />
		<font color="white">MY카페</font>
	</div>

	<div class="container">
		<iframe src="c_penalty.jsp"></iframe>
		<iframe src="c_Book_Status.jsp"></iframe>
	</div>






</body>
</html>