<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Lcb 로그인</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
  
    <link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<script src="${pageContext.request.contextPath }/resources/js/kakao.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user_login.css">


</head>

<body>
	<%@ include file = "../include/header.jsp" %>
	<br><br><br>
    <section class="login-form container"> 
    <br><br><br>
        <h1>LOGIN</h1>
        <form action="loginForm" method="post" style="padding:25px">
            <div class="int-area">
                <input type="text" name="MEMBERS_ID" id="MEMBERS_ID"
                
                autocomplete="off" required>
                <label for="id">USER NAME</label>
            </div>
            <div class="int-area">
                <input type="password" name="MEMBERS_PW" id="MEMBERS_PW"
                
                autocomplete="off" required>
                <label for="pw">PASSWORD</label>
            </div>
            <div class="btn-area">
                <button type="submit">LOGIN</button>
            </div>
            <br><br>
             
            <div class="btn-area">
                <button type="button" onclick="location.href='user_join'">회원가입</button>
            </div>     
            <br>
            <br>
            
            <div style="text-align: center;">
            <span class="btn-area">
                     <button type="button" class="Btn" style="width:12%; font-size:17px;" onclick="ModalId()">ID 확인</button>
            </span>
            <span class="btn-area">
                     <button type="button" class="Btn" style="width:12%; font-size:17px;" onclick="ModalPw()">비밀번호 확인</button>
            </span>
            </div>       
        </form>
        
        <form action="KakaoJoin" class="kakao" method="post" style="padding:0px" name="kakaoLogin">
            <div class="int-area">
                <input type="hidden" name="Kakao_ID" id="Kakao_ID" value="" autocomplete="off" required>
              
            </div>
            <div class="int-area">
                <input type="hidden" name="Kakao_Email" id="Kakao_Email"
                
                autocomplete="off" required>
               
            </div>
            <div class="int-area">
                <input type="hidden" name="Kakao_NickName" id="Kakao_NickName"
                
                autocomplete="off" required>
               
            </div>
             <div>
               <a id="custom-login-btn" href="javascript:loginFormWithKakao()">
        			<img class="kakaoBtn" src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg" width="222" />
    		   </a>                
            </div>
        </form>
        
    </section>
    
        <!-- 모달 -->
   <div class="modal fade" id="replyModal" role="dialog">
      <div class="modal-dialog modal-md">
         <div class="modal-content">
            <div class="modal-header">
               <button type="button" class="btn btn-default pull-right" data-dismiss="modal">닫기</button>
               <h4 class="modal-title">입력하세요</h4>               
            </div>
            <div class="modal-body">
               <!-- 수정폼 id값을 확인하세요-->
               <div class="reply-content">  
				<form action="" name="search" method="post" >                            
               <div class="reply-group">               
                  <div class="reply-input">
                     <input type="text" class="form-control" placeholder="아이디" name=MEMBERS_ID id="modalID"> 
                     <input type="text" class="form-control" placeholder="이메일" name="MEMBERS_EMAIL" id="modalEMAIL">
                  </div>
                  <button class="right btn btn-info" id="modalIdBtn" style="border-color: #503396;" onclick="searchId()">아이디 찾기</button>                  
                  <button class="right btn btn-info" id="modalPwBtn" style="border-color: #503396;" onclick="searchPw()">비밀번호 찾기</button>
               </div>
               </form>
               </div>
               <!-- 수정폼끝 -->
            </div>
         </div>
      </div>
   </div>
    
    
    
    
    
    <input type="hidden" id="msg" value="${msg}">
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
	<br><br><br>
    <script src="${pageContext.request.contextPath }/resources/js/user_login.js"></script>
    <script>
    
    
    
   		function ModalId(){ //hasClass Class 매개값이 포함되있다면 true를 반환
   			$(".modal-title").html("이메일을 입력하세요");
   			
   			$("#modalIdBtn").css("display","inline");
   			$("#modalPwBtn").css("display","none");
   			$("#modalID").css("display","none");
   			
   			$("#replyModal").modal("show");
   		} 
   		
   		function ModalPw() {
   			$(".modal-title").html("아이디와 이메일을 입력하세요");
   			
   			$("#modalIdBtn").css("display","none");
   			$("#modalPwBtn").css("display","inline");        			
   			$("#modalID").css("display","inline");
   			
   			$("#replyModal").modal("show");
   		}   
    
    
    
		function searchId(){
			if(search.MEMBERS_EMAIL.value!=null){
				search.action="sendid.do";
				search.submit();
			}if(search.MEMBERS_EMAIL.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
		
		function searchPw(){
			if((search.MEMBERS_ID.value!=null)&&(search.MEMBERS_EMAIL.value!=null)){
				search.action="sendpw.do";
				search.submit();
			}else if(search.MEMBERS_ID.value==null) {
				alert("아이디를 입력하세요.")
			}else if(search.MEMBERS_EMAIL.value==null) {
				alert("이메일주소를 입력하세요.")
			}
		
		}
	
	
	</script>
	<%@ include file = "../include/footer.jsp" %>
</body>
</html>
