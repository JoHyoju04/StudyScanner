<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
function c_check() {
	var id = document.getElementById("c_id").value;
	var url = "c_idCheck.jsp?c_id="+id;
    window.open(url, "get", "heigth=100, width=120");
}
</script>

<style type="text/css">
a:link {
   color: black;
   text-decoration: none
}

a:visited {
   color: black;
   text-decoration: none
}

a:hover {
   color: black;
   text-decoration: none
}

a:active {
   color: black;
   text-decoration: none
}

.Join {
   display: inline-block;
}

p {
   text-align: left;
}
</style>
</head>
<body>


   <h1 style="text-align: center;">
      <a href="index.html"> STUDY SCANNER </a>
   </h1>
   <hr color=#003399>

   <div class="container" style="text-align: center; width: 100%;">
      <h2>
         <img src="s2.png" alt="STUDY SCANNER" width="100" height="100"
            style="vertical-align: bottom">고객회원
      </h2>

      <div class="Join">
         <form method="post" action="ClientDoJoin">

            <p>아이디</p>
            <input type="email" name="c_id" id="c_id" placeholder="아이디를 입력해주세요" style="margin:0 0 0 70px; height: 30px; width: 500px;" required />
            <button class="btn" onclick="c_check()" type="button">중복체크</button>
            <p>비밀번호</p>
            <input type="password" name="c_passwd" id="c_passwd" placeholder="비밀번호를 입력해주세요" style="height: 30px; width: 500px;" required />
            <p>비밀번호확인</p>
            <input type="password" name="c_passwdCheck" placeholder="비밀번호확인을 입력해주세요"
               style="height: 30px; width: 500px;" required />
            <p>이름</p>
            <input type="text" name="c_name" placeholder="이름을 입력해주세요" style="height: 30px; width: 500px;"
               required />
            <p>전화번호</p>
            <input type="text" name="phoneNum" placeholder="전화번호를 입력해주세요"
               style="height: 30px; width: 500px;" required /><br> 
               <input
               type="submit" value="회원가입"
               style="height: 30px; width: 500px; color: white; background-color: #003399; text-align: center; border: none; margin-top: 10px;">

         </form>
      </div>

   </div>

</body>
</html>