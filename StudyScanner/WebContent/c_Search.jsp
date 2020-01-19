<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,model.*,java.util.ArrayList"%>
<!DOCTYPE html>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0"
   charset="UTF-8">
<meta name="description" content="">
<meta name="keywords" content="">
<title>Insert title here</title>
<script type="text/javascript">
function searchCheck(){
	var check=document.getElementById("search");
        if(check.value ==""){
        	
            alert("검색 단어를 입력하세요.");


            return false;


        }
        else{
        	document.s.submit();   
        }

           


    }

</script>


<style type="text/css">
h1 {
   text-align: center;
}

.container { //
   text-align: center;
}

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

.cSearch {
   border-top: none;
   border-left: none;
   border-right: none;
   border-bottom: 1px solid #003399;
   width: 250px;
}

.form {
   text-align: center;
}

.searchBtn {
   border: 1px solid #003399;
   padding: 3px 15px 3px 15px;
   margin: 5px 5px 5px 5px;
   border-radius: 20px;
   background-color: white;
   color: #003399;
}

.c_menu {
   color: #003399;
   text-align: right;
}

.abcd {
   width: inherit;
   height: 450px;
   background-color: powderblue;
   text-align: center;
}

th {
   background-color: #D9E5FF;
   height: "100px";
}

img {
   margin-bottom: 5px;
}

table {
   width: 100%
}
</style>

</head>
<body>
<jsp:useBean id="dao" class="model.StudyCafe"  scope="session"/>


 
   <div class="c_menu">
      <a href="logout.jsp">로그아웃</a> | <a href="c_Modify.jsp">마이페이지</a> | <a
         href="c_MyCafe.jsp">My카페</a>
   </div>

   <h1>
      <a href="c_Search.jsp">STUDY SCANNER</a>

   </h1>
   <hr color=#003399>
   <div class="container">
      <div class="form">
         <form class="cafeSearch" name="s" method="post">

            <img src="s2.png" align="center" width="50px" height="40px" /> 
            <input type="text" class="cSearch" name="cafe_search" id="search" />
            <input type="submit" class="searchBtn"  onclick="searchCheck()" value="검색" />
         </form>
         <hr color=#003399>
         <% 
         request.setCharacterEncoding("UTF-8");
            ServletContext sc;
        	Connection conn;
        	String result;
    
        	sc = getServletContext();
            conn= (Connection) sc.getAttribute("DBconnection");
            String name=request.getParameter("cafe_search");
  
            ArrayList<StudyCafe> cafe=DBUtil.searchCafe(conn, name);
        
            response.setContentType("text/html; charset=UTF-8");
         %>
         <table cellpadding="5" cellspacing="5" border="0">
            <tr>
               <th width="25%">카페명</th>
               <th width="50%">주소</th>
               <th width="25%">전화번호</th>
            </tr>

     
<%


    for(StudyCafe c : cafe){


    %>
     

         <tr align="center">
            <td><a href="c_cafeDisplay.jsp?cafename=<%=c.getCafeName()%>"><%=c.getCafeName()%></td>
            <td><%=c.getAddress() %></td>
            <td><%=c.getTel()%></td>
        </tr>

            
 <%


    }


     %>
            
         </table>
      </div>
   </div>
</body>
</html>