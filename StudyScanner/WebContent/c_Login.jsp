<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>


<h1 style="text-align: center;">
<a href="index.html">
    STUDY SCANNER
    </a>
  </h1>
  <hr color=#003399> 
    
  <div class="container" style="text-align:center;">
  
  <h2><img src="s2.png" alt="STUDY SCANNER" width="100" height="100" style="vertical-align: bottom">고객회원</h2>
  
  <form method="post" action="DoLogin">
    <input type="text" name="c_id" placeholder="아이디를 입력하세요" style="height:30px; width:300px;" required/> <br/>
	<input type="password" name="c_passwd" placeholder="비밀번호를 입력하세요"style="height:30px; width:300px; margin:10px;" required/><br/>
	<input type="submit" value="로그인" style="height:30px; width:300px; color:white; background-color:#003399; text-align: center; border: none; margin-bottom:10px;"/><br/>
	
  </form>
  <div style="margin:20;">
    <a href="c_IdPwSearch.jsp" style="margin:10px;">아이디찾기 비밀번호찾기</a>
	<a href="c_Join.jsp" style="margin:10px;">회원가입</a>
  </div>
  </div>

</body>
</html>