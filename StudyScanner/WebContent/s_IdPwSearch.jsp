<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.DBUtil,java.io.PrintWriter" %>    
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
a:link            {color:black; text-decoration:none} 
a:visited        {color:black; text-decoration:none}
a:hover        {color:black;   text-decoration:none }
a:active        {color:black; text-decoration:none}
.container{
text-align:center;}

p{
text-align:left;}

.tab {
  overflow: hidden;
  border: 1px solid #ccc;
  background-color: #f1f1f1;
}


.tab button {
  background-color: inherit;
  float: left;
  border: none;
  outline: none;
  cursor: pointer;
  padding: 14px 16px;
  transition: 0.3s;
}


.tab button:hover {
  background-color: #ddd;
}


.tab button.active {
  background-color: #ccc;
}


.tabcontent {
  display: none;
  padding: 6px 12px;
  border: 1px solid #ccc;
  border-top: none;
}
</style>
</head>
<script type="text/javascript">
function openSearch(evt, action) {

     var i, tabcontent, tablinks;

     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }

     tablinks = document.getElementsByClassName("tablinks");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }

     document.getElementById(action).style.display = "block";
     evt.currentTarget.className += " active";
   }
</script>
<body>
<h1 style="text-align: center;"><a href="index.html">
    STUDY SCANNER
    </a>
  </h1>
  <hr color=#003399> 
  
  
  <div class="container">
  <div class="tab">
  <button class="tablinks" onclick="openSearch(event, 'id')">아이디 찾기</button>
  <button class="tablinks" onclick="openSearch(event, 'pw')">비밀번호 찾기</button>
</div>

<!-- Tab content -->
<div id="id" class="tabcontent">
<form method="post" action="s_IDSearch.jsp" >
<p>카페명</p>
<input type="text" name="cafeName" style="height:30px; width:500px;" required/>
<p>주소</p>
<input type="text" name="address" style="height:30px; width:500px;" required/>

<input type="submit" value="아이디 찾기"  style="height:30px; width:200px; margin:20px;"/><br/>
</form>
</div>

<div id="pw" class="tabcontent">
<form method="post" action="s_PWSearch.jsp" >
<p>아이디</p>
<input type="email" name="s_id" style="height:30px; width:500px;" required/>
<p>카페명</p>
<input type="text" name="cafeName" style="height:30px; width:500px;" required/>
<p>주소</p>
<input type="text" name="address" style="height:30px; width:500px;" required/>
<input type="submit" value="비밀번호 찾기" style="height:30px; width:500px; margin:20px;"/><br/>
</form>

</div>

  
  </div>

</body>
</html>