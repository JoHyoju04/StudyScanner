<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page
	import="java.sql.Connection,model.DBUtil,java.io.PrintWriter"%>
	
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<!--JAVASCRIPT -->
<script src="http://code.jquery.com/jquery-1.9.1.min.js">
	
</script>
<script type="text/javascript">
	var arrNumber = new Array();
	for (var i = 0; i < 100; i++) {
		arrNumber[i] = 0;
	}

	j = 0;
	function set_color(cell) {
		if (cell.style.background !== 'powderblue') {
			cell.style.background = 'powderblue';
			arrNumber[cell.id] = 1;
		} else if (cell.style.background !== 'white') {
			cell.style.background = 'white';
			arrNumber[cell.id] = -1;
		}
		j++;
	}

	function seat_save() {
		window.location.replace("seatSave.jsp?arrNumber=" + arrNumber);

	}
</script>

<title>카페등록</title>

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

.c_menu {
	color: #003399;
	text-align: right;
}

.content {
	background: #003399;
	border-radius: 30px;
}

img {
	margin: 10px;
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

h1 {
	text-align: center;
}

.explain {
	font-size: 15px;
	margin: 50px;
	text-align: center;
}

p {
	font-size: 15px;
	margin: 20px;
}

td {
	table-layout: fixed; word-break; break-all;
	border-collapse: collaspe;
	width: 100px;
	height: 40px;
	cursor: pointer;
	background-color: white;
	text-align: center;
}

td:hover {
	background: #D9E5FF;
}

table {
	margin: auto;
}

.enter {
	background-color: white;
	border: 1px solid #003399;
	padding: 2px;
	color: #003399;
	border-radius: 2px;
	margin: 5px;
}

.button {
	color: black;
	background-color: white;
	width: 100px;
	height: 40px;
}
#center {
	text-align: center;
	align: center;
}
</style>


</head>
<body>
	
	<div class="c_menu">
		<a href="logout.jsp">로그아웃</a> | <a href="s_Modify.jsp">마이페이지</a>
	</div>


	<h1>
		<a href="s_Choice.jsp">STUDY SCANNER</a>
	</h1>
	<div class="content">
		<img src="logo_blue.png" align="center" width="50px" height="40px" />
		<font color="white">개인 좌석 등록</font>
	</div>

	<div class="explain">
		<div id="result"></div>
		*매장의 좌석 배치에 따라 빈 칸을 눌러주세요.<br> <br> <font>*문위치를 고려하여
			설정해주세요.</font><br>
		<table id="myTable" border="1" style="border-collapse: collapse;"
			cellpadding="8">
			<!--1st ROW-->
			<tr>

				<td onclick="set_color(this);" id="0"></td>
				<td onclick="set_color(this);" id="1"></td>
				<td onclick="set_color(this);" id="2"></td>
				<td onclick="set_color(this);" id="3"></td>
				<td onclick="set_color(this);" id="4"></td>
				<td onclick="set_color(this);" id="5"></td>
				<td onclick="set_color(this);" id="6"></td>
				<td onclick="set_color(this);" id="7"></td>
				<td onclick="set_color(this);" id="8"></td>
				<td onclick="set_color(this);" id="9"></td>

			</tr>

			<!--2nd ROW-->
			<tr>
				<td onclick="set_color(this);" id="10"></td>
				<td onclick="set_color(this);" id="11"></td>
				<td onclick="set_color(this);" id="12"></td>
				<td onclick="set_color(this);" id="13"></td>
				<td onclick="set_color(this);" id="14"></td>
				<td onclick="set_color(this);" id="15"></td>
				<td onclick="set_color(this);" id="16"></td>
				<td onclick="set_color(this);" id="17"></td>
				<td onclick="set_color(this);" id="18"></td>
				<td onclick="set_color(this);" id="19"></td>
			</tr>

			<!--3rd ROW-->
			<tr>
				<td onclick="set_color(this);" id="20"></td>
				<td onclick="set_color(this);" id="21"></td>
				<td onclick="set_color(this);" id="22"></td>
				<td onclick="set_color(this);" id="23"></td>
				<td onclick="set_color(this);" id="24"></td>
				<td onclick="set_color(this);" id="25"></td>
				<td onclick="set_color(this);" id="26"></td>
				<td onclick="set_color(this);" id="27"></td>
				<td onclick="set_color(this);" id="28"></td>
				<td onclick="set_color(this);" id="29"></td>
			</tr>
			<!--4th ROW-->
			<tr>
				<td onclick="set_color(this);" id="30"></td>
				<td onclick="set_color(this);" id="31"></td>
				<td onclick="set_color(this);" id="32"></td>
				<td onclick="set_color(this);" id="33"></td>
				<td onclick="set_color(this);" id="34"></td>
				<td onclick="set_color(this);" id="35"></td>
				<td onclick="set_color(this);" id="36"></td>
				<td onclick="set_color(this);" id="37"></td>
				<td onclick="set_color(this);" id="38"></td>
				<td onclick="set_color(this);" id="39"></td>
			</tr>
			<!--5th ROW-->
			<tr>

				<td onclick="set_color(this);" id="40"></td>
				<td onclick="set_color(this);" id="41"></td>
				<td onclick="set_color(this);" id="42"></td>
				<td onclick="set_color(this);" id="43"></td>
				<td onclick="set_color(this);" id="44"></td>
				<td onclick="set_color(this);" id="45"></td>
				<td onclick="set_color(this);" id="46"></td>
				<td onclick="set_color(this);" id="47"></td>
				<td onclick="set_color(this);" id="48"></td>
				<td onclick="set_color(this);" id="49"></td>
			</tr>
			<!--6th ROW-->
			<tr>
				<td onclick="set_color(this);" id="50"></td>
				<td onclick="set_color(this);" id="51"></td>
				<td onclick="set_color(this);" id="52"></td>
				<td onclick="set_color(this);" id="53"></td>
				<td onclick="set_color(this);" id="54"></td>
				<td onclick="set_color(this);" id="55"></td>
				<td onclick="set_color(this);" id="56"></td>
				<td onclick="set_color(this);" id="57"></td>
				<td onclick="set_color(this);" id="58"></td>
				<td onclick="set_color(this);" id="59"></td>
			</tr>
			<!--7th ROW-->
			<tr>
				<td onclick="set_color(this);" id="60"></td>
				<td onclick="set_color(this);" id="61"></td>
				<td onclick="set_color(this);" id="62"></td>
				<td onclick="set_color(this);" id="63"></td>
				<td onclick="set_color(this);" id="64"></td>
				<td onclick="set_color(this);" id="65"></td>
				<td onclick="set_color(this);" id="66"></td>
				<td onclick="set_color(this);" id="67"></td>
				<td onclick="set_color(this);" id="68"></td>
				<td onclick="set_color(this);" id="69"></td>
			</tr>
			<!--8th ROW-->
			<tr>
				<td onclick="set_color(this);" id="70"></td>
				<td onclick="set_color(this);" id="71"></td>
				<td onclick="set_color(this);" id="72"></td>
				<td onclick="set_color(this);" id="73"></td>
				<td onclick="set_color(this);" id="74"></td>
				<td onclick="set_color(this);" id="75"></td>
				<td onclick="set_color(this);" id="76"></td>
				<td onclick="set_color(this);" id="77"></td>
				<td onclick="set_color(this);" id="78"></td>
				<td onclick="set_color(this);" id="79"></td>
			</tr>
			<!--9th ROW-->
			<tr>
				<td onclick="set_color(this);" id="80"></td>
				<td onclick="set_color(this);" id="81"></td>
				<td onclick="set_color(this);" id="82"></td>
				<td onclick="set_color(this);" id="83"></td>
				<td onclick="set_color(this);" id="84"></td>
				<td onclick="set_color(this);" id="85"></td>
				<td onclick="set_color(this);" id="86"></td>
				<td onclick="set_color(this);" id="87"></td>
				<td onclick="set_color(this);" id="88"></td>
				<td onclick="set_color(this);" id="89"></td>
			</tr>
			<tr>
				<td onclick="set_color(this);" id="90"></td>
				<td onclick="set_color(this);" id="91"></td>
				<td onclick="set_color(this);" id="92"></td>
				<td onclick="set_color(this);" id="93"></td>
				<td onclick="set_color(this);" id="94"></td>
				<td onclick="set_color(this);" id="95"></td>
				<td onclick="set_color(this);" id="96"></td>
				<td onclick="set_color(this);" id="97"></td>
				<td onclick="set_color(this);" id="98"></td>
				<td onclick="set_color(this);" id="99"></td>
			</tr>
		</table>
		
		<div id="center">
			<div id="door">
				<h1>문</h1>
			</div>
		</div>



	</div>
	<button onclick="seat_save()" class="btn">좌석 등록완료</button>



	<!-- location.href='room_Registration.jsp' -->





</body>
</html>