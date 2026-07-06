<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 이벤트 상세화면</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/kakao.js"> </script>

<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/resources/css/includebootstrap.css"
	rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/style.css"
	rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/eventDetail.css">

</head>
<body>
<%@ include file = "../include/header.jsp" %>
    <br>
    <br>
    <br>

   <div id="contents" class="">

      <!-- event-detail -->
      <div class="event-detail">
         <h2 class="tit">${Event_Title}</h2>
         <p class="event-detail-date">
            <span>기간</span> 
            <em>
               	<fmt:formatDate value="${Event_StartDate }" pattern="yyyy-MM-dd"/>  ~ <fmt:formatDate value="${Event_EndDate }" pattern="yyyy-MM-dd"/>
      
            </em>
         </p>
               <div class="share container" style="text-align: right;">
               <h4><b>공유하기 >>></b></h4><br> 
               <a id="kakao-link-btn"   href="javascript:kakaoLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakao.png"   alt="카카오톡 공유" width="30px" height="30px"></a>
                
               <a   id="kakao-story-btn" href="javascript:kakaostoryLink()">
               <img src="${pageContext.request.contextPath}/resources/img/kakaostory.png" alt="카카오스토리 공유" width="30px" height="30px"></a> 
               
               <a id="facebook-btn" href="javascript:facebookLink()">
               <img src="${pageContext.request.contextPath}/resources/img/facebook.jpg" alt="페이스북 공유" width="30px" height="30px"></a>
               
               <a id="twitter-btn" href="javascript:twitterLink()">
               <img src="${pageContext.request.contextPath}/resources/img/twitter.jpg" alt="트위터 공유" width="30px" height="30px"></a>
               
               <a class="img_url" id="URL-btn" href="javascript:URLLink()">
               <img src="${pageContext.request.contextPath}/resources/img/URL.png" alt="URL 공유" width="30px" height="30px"></a>
      		 </div>
		       <div class="event-html">		      
				<img  src="${pageContext.request.contextPath}/resources/img/${Event_URL}" width= "1100px" height= "3522px" alt="스펀지 새창" onerror="errorImage(this)">
		       </div>




	


         <!--// iframe 아닐 때  -->
      </div>
      <!--// event-detail -->

      <!-- 댓글 이벤트 상세페이지 -->


      <!-- 빵원쿠폰플러스/빵원쿠폰/응모하기/쿠폰다운/URL링크 이벤트 상세페이지 -->
   </div>
    <br>
    <br>
    <br>
   <%@ include file = "../include/footer.jsp" %>
   
   <script>
   
    var lcbKakaoJavaScriptKey = "";
    if (window.Kakao && lcbKakaoJavaScriptKey) {
        Kakao.init(lcbKakaoJavaScriptKey);
    }
     function kakaoLink() {
         if (!window.Kakao || !lcbKakaoJavaScriptKey) {
             alert("카카오 JavaScript 키가 설정되지 않았습니다.");
             return;
         }
         Kakao.Link.sendDefault({
             objectType: 'feed',
             content: {
                 title: "${vo.title}",
                 description: "${vo.content}",
                 imageUrl: document.images[0].src,
                 link: {
                     mobileWebUrl: document.location.href,
                     webUrl: document.location.href,
                 },
             },
             buttons: [{
                 title: '웹으로 보기',
                 link: {
                     mobileWebUrl: document.location.href,
                     webUrl: document.location.href,
                 }
             }]
         });
     }
     function kakaostoryLink(){
         if (!window.Kakao || !lcbKakaoJavaScriptKey) {
             alert("카카오 JavaScript 키가 설정되지 않았습니다.");
             return;
         }
         Kakao.Story.share({
             url: document.location.href,
             text: "${vo.content}",
         });
     }
     function facebookLink(){
         var sharer = "https://www.facebook.com/sharer/sharer.php?u=";
      var content_url = encodeURIComponent(document.location.href);
         window.open(sharer + content_url, 'facebook_share_dialog', 'width=626,height=436');
     }
     function twitterLink(){
         window.open("https://twitter.com/intent/tweet?text="+"${vo.content}"+"&url="+document.location.href);
     }
     function URLLink(){
         alert_content = "해당 글의 주소입니다.\nCtrl+C를 눌러 클립보드로 복사하세요.";
      temp = prompt(alert_content, document.location.href);
     }
   
   </script>
   
</body>
</html>
