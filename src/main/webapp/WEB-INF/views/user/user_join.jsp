<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lcb 회원가입</title>

 <script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user_join.css">
</head>
<body>
   <%@ include file = "../include/header.jsp" %>
   <br><br><br>
   <input type="radio">
    <section class="login-form">
        <div class="container">    
        
        
        <form action="joinForm" method="post" name="joinForm" id ="joinForm">
        <br><br><br> 
        <div class= "pybp">       
                   <h1 class="pyb">회원가입</h1>
                   
                   </div>   
               <br><br>
                <div class="register int-area">
                    <input type="text" size="20" id="MEMBERS_ID" name="MEMBERS_ID" autocomplete="off" placeholder="               영문포함 4~12자" required>
                    <label for="id">회원ID</label>
                    
                  <span class="btn-area">
                     <button type="button" class="Btn" id="idCheckBtn">ID 중복 검사</button>
                  </span>
                   <div>
                    <span id="msgId"></span><!--자바스크립트에서 추가-->
                    </div>  
                </div>
                
                 
                <div class="int-area">
                    <input type="password" name="MEMBERS_PW"  size="35" id="MEMBERS_PW" onchange="isSame()" placeholder="                    영 대/소문자, 숫자 조합 8~16자 " autocomplete="off" required>
                    <label for="pw">비밀번호</label>
                </div>
                   <div>
                    <span id="msgPw"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">
                    <input type="password" name="pwCheck"  size="35" id="pwCheck" onchange="isSame()" autocomplete="off" required>
                    <label for="pwConfirm">비밀번호 확인</label>
                </div>
                    <div>
                    <span id="msgPwCheck"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">                    
                    <input type="text" name="MEMBERS_NAME" id ="MEMBERS_NAME" size="35" autocomplete="off" required>
                    <label for="name">이 름</label>
                </div>
                    <div>
                    <span id="msgName"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">
                    <input type="tel" name="MEMBERS_NICKNAME" id="MEMBERS_NICKNAME"  size="35" autocomplete="off"  required>
                    <label for="phone">닉네임</label>
                </div>
                    <div>
                    <span id="msgNick"></span><!--자바스크립트에서 추가-->
                    </div>
                 <div class="int-area">
                    <input type="tel" name="MEMBERS_PHONE" id="MEMBERS_PHONE"  size="35" autocomplete="off"  required>
                    <label for="phone">핸드폰 번호</label>
                </div>
                    <div>
                    <span id="msgPhone"></span><!--자바스크립트에서 추가-->
                    </div>
                
                <div class="int-area">                    
                    <input type="email" name="MEMBERS_EMAIL"  size="35" autocomplete="off"  required>
                    <label for="email">이메일</label>
                </div>
                    <div>
                    <span id="msgEmail"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="register int-area">                                  
                        <input type="text"  name="addrZipNum" size="20" id="addrZipNum" readonly="readonly" >
                       <label for="address">주 소</label>  
                  <span class="btn-area">
                        <button type="button" class="Btn" onclick="goPopup()">우편번호 찾기</button>
                    </span>
            </div>
              <div class="int-area">                        
                    <input type="text"  name="addrBasic"  size="35" id="addrBasic" placeholder="지번주소" readonly="readonly" onclick="goPopup()">                           
                        
                </div>
                    <div>
                    <span id="msgAddr"></span><!--자바스크립트에서 추가-->
                    </div>
                <div class="int-area">  
                    <input type="text" name="addrDetail" id ="addrDetail"  size="35" placeholder="나머지 주소" autocomplete="off" required>
                    
                </div>    
                
                <div class="btn-area">
                   <button type="button" id="joinBtn" >회원가입</button>
               </div>        
        </form>
        </div>
    </section>
   <br><br><br>
   <br><br><br>
   <script src="${pageContext.request.contextPath }/resources/js/user_join.js"></script>
   <%@ include file = "../include/footer.jsp" %>
   
</body>
</html>