<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="java.sql.Connection,model.DBUtil,java.io.PrintWriter"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
	charset="UTF-8">
<title>카페등록</title>
<script type="text/javascript">
function seatRes(cell){
   if(document.getElementById(cell.id).getAttribute("bgcolor")!="black"){
    var seatS=document.getElementById(cell.id).id;
    var url="s_updateSeat.jsp?seatS="+seatS;
    window.location.replace(url);}
 }
</script>
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
	margin-bottom: 20px;
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

#center {
	text-align: center;
	align: center;
}

h1 {
	align: center;
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
	text-align: center;
}

table {
	margin: auto;
}

#area {
	align: center;
	text-align: center;
}

.enter {
	background-color: white;
	border: 1px solid #003399;
	padding: 2px;
	color: #003399;
	border-radius: 2px;
	margin: 5px;
}

#door {
	margin-top: 20px;
	width: 600px;
	text-align: center;
	align: center;
	margin: auto;
}

.button {
	color: black;
	background-color: white;
	width: 100px;
	height: 40px;
}
button {
	border: 2px solid #003399;
	padding: 5px 15px 5px 15px;
	margin: 5px 5px 5px 100px;
	border-radius: 20px;
	background-color: white;
	color: #003399;
}
</style>
<!--JAVASCRIPT -->
<script src="http://code.jquery.com/jquery0.9.1.min.js">
</script>

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
		<font color="white">좌석관리</font>
	</div>
	<%! int index=0;
         ServletContext sc;
              Connection conn;
              String rs;
              String bgcolor;%>
	<%index=0; %>
	<% session=request.getSession();
String s_id=(String)session.getAttribute("s_id");%>


	<div id="area">
	<p style="color: black">
		* 예약불가능한 좌석(사용중인 좌석)  : 파랑색<br> * 예약가능한 좌석 : 하늘색<br> * 없는 좌석 : 검은색
		<br> * [해당좌석을 클릭] 예약불가능한 좌석(파랑색)->예약가능한 좌석(하늘색)<br>예약가능한 좌석(하늘색)->예약불가능한 좌석(파랑색)
	</p><br> <br>
	<button type="button" onclick="location.href='s_BookInfo.jsp' ">예약관리</button>

		<table id="myTable" border="1" style="border-collapse: collapse;"
			cellpadding="8">
			<!-0st ROW-->
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="0" class="0">0</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="1">1</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
          
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="2">2</td>
				<% 
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
           
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="3">3</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="4">4</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="5">5</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
         
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="6">6</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
           
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="7">7</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
          
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="8">8</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
       
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="9">9</td>



			</tr>

			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
       
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="10">10</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="11">11</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="12">12</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="13">13</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="14">14</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="15">15</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="16">16</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="17">17</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="18">18</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="19">19</td>



			</tr>

			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="20">20</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="21">21</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="22">22</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="23">23</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="24">24</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="25">25</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="26">26</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="27">27</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="28">28</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="29">29</td>



			</tr>

			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="30">30</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="31">31</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="32">32</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
             if(rs.equals("0")){
                 bgcolor="black";
              }
             else if(rs.equals("2")){
          	   bgcolor="powderblue";
          	   }
             else if(rs.equals("1")){
          	   bgcolor="#003399";
          	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="33">33</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="34">34</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="35">35</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="36">36</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="37">37</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="38">38</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="39">39</td>



			</tr>

			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="40">40</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="41">41</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="42">42</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="43">43</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="44">44</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="45">45</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="46">46</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="47">47</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="48">48</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="49">49</td>



			</tr>
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="50"
					class="0">50</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="51">51</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="52">52</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else{
                 bgcolor="powderblue";
              }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="53">53</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="54">54</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="55">55</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="56">56</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="57">57</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="58">58</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="59">59</td>



			</tr>
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="60">60</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="61">61</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="62">62</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="63">63</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="64">64</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="65">65</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="66">66</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else{
                 bgcolor="powderblue";
              }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="67">67</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="68">68</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="69">69</td>



			</tr>
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="70">70</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="71">71</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="72">72</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="73">73</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="74">74</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="75">75</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="76">76</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="77">77</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="78">78</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="79">79</td>
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="80">80</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="81">81</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="82">82</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="83">83</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="84">84</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="85">85</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="86">86</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="87">87</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="88">88</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="89">89</td>
			<tr>
				<%
         sc = getServletContext();
         conn= (Connection) sc.getAttribute("DBconnection");
            rs=DBUtil.seatUpload(conn, s_id ,index);
           // bgcolor="white";
          System.out.println(rs);
          index++;
           if(rs.equals("0")){
              bgcolor="black";
           }
           else if(rs.equals("2")){
        	   bgcolor="powderblue";
        	   }
           else if(rs.equals("1")){
        	   bgcolor="#003399";
        	   }
           
          
            %>

				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="90">90</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
              // bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="91">91</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
            //   bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
       
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="92">92</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="93">93</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="94">94</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="95">95</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="96">96</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="97">97</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
             //  bgcolor="white";
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="98">98</td>
				<%
            sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
               rs=DBUtil.seatUpload(conn, s_id ,index);
          
             System.out.println(rs);
             index++;
              if(rs.equals("0")){
                 bgcolor="black";
              }
              else if(rs.equals("2")){
           	   bgcolor="powderblue";
           	   }
              else if(rs.equals("1")){
           	   bgcolor="#003399";
           	   }
           
            %>
				<td onclick="seatRes(this);" bgcolor="<%=bgcolor%>" id="99">99</td>



			</tr>
		</table>
		<div id="center">
			<div id="door">
				<h1>문</h1>
			</div>
		</div>
	</div>



</body>
</html>