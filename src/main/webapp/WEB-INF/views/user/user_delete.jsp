<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<title>Lcb 회원삭제</title>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-idth, initial-scale=1">
   

    <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
	<link href="${pageContext.request.contextPath}/resources/css/user_delete.css" rel="stylesheet">



</head>
<body>
   <%@ include file = "../include/header.jsp" %>
   <br><br><br>
   <input type="radio">
    <section class="login-form">
        <div class="container">    
        
        
        
      

      <form action="DeleteForm" method="post" > 
        <h2>현재 비밀번호를 입력하세요.</h2>
        <br><br>
        
        <div class="pw" width="80%">
         <span class="spa">비밀번호:</span> <input type="password" name="MEMBERS_PW" class="pass" >
         <button type="submit" class="button purple large">확인</button>
      </div>
          
      </form>   
        
        </div>
    </section>

	<br><br><br><br><br>
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	<br><br><br><br><br>
	<br><br><br><br><br>
	
	
	<%@ include file = "../include/footer.jsp" %>
	
	
</body>
</html>