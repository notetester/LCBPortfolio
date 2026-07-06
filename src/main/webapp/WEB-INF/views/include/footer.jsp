<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/footer.css">
<script src="${pageContext.request.contextPath }/resources/js/kakao.js"></script>
</head>
<body>
<footer>
       <!-- footer-bottom -->
      <div class="footer">
          <div class="inner_footer">
              <div class="logo_container">
                  <img src="${pageContext.request.contextPath}/resources/img/Lcb1.png">
              </div>
              <div class="footer_third">
	
                  <h1>Lcb : CINEMA</h1>
                  
                  <p>서울특별시 강남구 (역삼동, 제이슨타워)</p>
                  <p>ARS 1234-5678  || 대표자명: 홍길동</p>
                  <p> 사업자등록번호 123-45-67890  ||  통신판매업신고번호 제 001호</p>
                  <p class="copy">COPYRIGHT © Mr.Hong , LCB_engineering</p>
              </div>

			<div id="create-channel-add-button"></div>
			
            
          </div>
      </div>
<script type="text/javascript">
				var lcbKakaoJavaScriptKey = "";
				if (window.Kakao && lcbKakaoJavaScriptKey) {
				  Kakao.init(lcbKakaoJavaScriptKey);
				  Kakao.Channel.createAddChannelButton({
				    container: '#create-channel-add-button',
				    channelPublicId: '_jmJRK',
				  });
				}
			</script>
  </footer>
</body>
</html>
