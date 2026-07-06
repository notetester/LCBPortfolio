<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 카카오 회원가입</title>

 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link href="${pageContext.request.contextPath}/resources/css/kakaoJoin.css" rel="stylesheet">

</head>
<body>
   <%@ include file = "../include/header.jsp" %>
   <br><br><br>
   <input type="radio">
    <section class="login-form">
        <div class="container">    
        
        
        <form action="KakaoJoinForm" method="post" name="KakaoJoinForm" id ="KakaoJoinForm">
        <br><br><br> 
        <div class= "pybp">       
                   <h1 class="pyb">카카오 간편 회원가입</h1>
                   
                   </div>   
               <br><br>
                <div class="register int-area kakao">
                    <input type="hidden"  size="25" id="MEMBERS_ID" name="MEMBERS_ID" autocomplete="off" value="${Kakao_ID}" required readonly>
                    <label for="id">회원ID</label>
              	</div>
              	
                <div class="int-area " >                    
                    <input type="text"   name="MEMBERS_NAME" id ="MEMBERS_NAME" size="25" autocomplete="off" required >
                    <label for="name">이 름</label>
                </div>
                    <div>
                    <span id="msgName"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area kakao">
                    <input type="hidden"    name="MEMBERS_NICKNAME" id="MEMBERS_NICKNAME"  size="25" autocomplete="off" value="${Kakao_NickName}" required>
                    <label for="phone">닉네임</label>
                </div>
                    <div>
                    <span id="msgNick"></span><!--자바스크립트에서 추가-->
                    </div>
                 <div class="int-area" >
                    <input type="tel"    name="MEMBERS_PHONE" id="MEMBERS_PHONE"  size="25" autocomplete="off"  required>
                    <label for="phone">핸드폰 번호</label>
                </div>
                    <div>
                    <span id="msgPhone"></span><!--자바스크립트에서 추가-->
                    </div>
                
                <div class="int-area kakao">                    
                    <input type="hidden" class = "kakao"  name="MEMBERS_EMAIL"  size="25" autocomplete="off" value="${Kakao_Email}" required>
                    <label for="email">이메일</label>
                </div>
                    <div>
                    <span id="msgEmail"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="register int-area">                                  
                        <input type="text"  name="addrZipNum" size="13" id="addrZipNum" readonly="readonly"  >
                       <label for="address">주 소</label>  
                  <span class="btn-area">
                        <button type="button" class="Btn" onclick="goPopup()">우편번호 찾기</button>
                    </span>
            </div>
              <div class="int-area">                        
                    <input type="text"  name="addrBasic"  size="25" id="addrBasic" placeholder="지번주소" readonly="readonly" onclick="goPopup()">                           
                        
                </div>
                    <div>
                    <span id="msgAddr"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">  
                    <input type="text" name="addrDetail" id ="addrDetail"  size="25" placeholder="나머지 주소" size="25"  autocomplete="off" required>
                    
                </div>    
                
                <div class="btn-area">
                   <button type="submit" id="joinBtn" >가입하기</button>
               </div>
              
        </form>
        </div>
    </section>
   <br><br><br>
   <br><br><br>
	<script src="${pageContext.request.contextPath}/resources/js/kakaoJoin.js"></script>
   <%@ include file = "../include/footer.jsp" %>
</body>
</html>