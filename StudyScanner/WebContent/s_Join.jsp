<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">

function s_check() {
	var id = document.getElementById("s_id").value;
	var url = "s_idCheck.jsp?s_id="+id;
    window.open(url, "get", "heigth=100, width=120");
}
</script>

<style type="text/css">
a:link            {color:black; text-decoration:none} 
a:visited        {color:black; text-decoration:none}
a:hover        {color:black;   text-decoration:none }
a:active        {color:black; text-decoration:none}

.Join{
display: inline-block;
}
p{
text-align:left;
}
</style>
</head>
<body>

  <h1 style="text-align: center;">
  <a href="index.html">
    STUDY SCANNER
    </a>
  </h1>
  <hr color=#003399> 
    
  <div class="container" style="text-align:center; width: 100%;">
  
  <h2><img src="s2.png" alt="STUDY SCANNER" width="100" height="100" style="vertical-align: bottom">관리회원</h2>

  <div class="Join">
  <form method="post" action="StaffDoJoin" enctype="multipart/form-data">

<p>카페명</p>
<input type="text" name="cafeName" style="height:30px; width:500px;" required/>
<p>주소</p>
<input type="text" name="address" style="height:30px; width:500px;" required/>
<p>아이디</p>
<input type="email" name="s_id" id="s_id"style="height:30px; width:500px;" required/>
<button class="btn" onclick="s_check()" type="button">중복체크</button>
<p>비밀번호</p>
<input type="password" name="s_passwd" style="height:30px; width:500px;" required/>
<p>비밀번호확인</p>
<input type="password" name="s_passwdCheck" style="height:30px; width:500px;" required/>

<p>사업자 등록 인증 
<input type="file" name="s_bn" id="certification" style="margin:20px;"/></p><br>

<input type="submit" value="회원가입" style="height:30px; width:500px; color:white; background-color:#003399; text-align: center; border: none;">
</form>
  </div>
  
  </div>

</body>
</html>