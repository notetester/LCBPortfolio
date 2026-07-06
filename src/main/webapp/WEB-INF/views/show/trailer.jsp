<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/index.css">
        
        <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
		<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
        <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/popper.min.js"></script>
        <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/sockjs.min.js"></script>
        <title>LCB 채팅하기</title>
</head>
<body>
	
	 <%@ include file = "../include/header.jsp" %>
    <br><br><br>

    <div class="container">
        <div class="row">
            <div class="col-md-4 order-md-2 mb-4">
                <div id="main">
			        <div id="chat">
			            <!-- 채팅 메시지 영역 -->
						<div id="messageArea"></div>
			        </div>
			        <div>
						<input type="text" id="message" placeholder="메시지를 입력해주세요." />
						<input type="button" id="sendBtn" value="전송"/>
			        </div>
			    </div>
            </div>
            <div class="col-md-8 order-md-1">
                <h4 class="mb-3" style="margin-top:100px;">다같이 실시간 영화보기</h4>
                <iframe width="560" height="315" src="https://www.youtube.com/embed/PVP5ZJuI57c?autoplay=1" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
            </div>
        </div>
    </div>
    
    <br><br><br>
    <%@ include file = "../include/footer.jsp" %>
    
</body>
<script type="text/javascript">
	var name="${NickName}";
	
	if(name==''){
		name="손님";
	}
	$("#sendBtn").click(function() {
		sendMessage();
		$('#message').val('');
	});
	$("#message").on("keydown",function(e) {
		if (e.keyCode == 13) {
			sendMessage();
			$('#message').val('');
		}
	});
	let sock = new SockJS("http://13.209.171.25:8181/lcb/echo/");
	sock.onmessage = onMessage;
	sock.onclose = onClose;
	// 메시지 전송
	function sendMessage() {
		sock.send(name+" : "+$("#message").val());
	}
	// 서버로부터 메시지를 받았을 때
	function onMessage(msg) {
		var data = msg.data;
		var cname = data.substring(0,data.indexOf(" "));
		var mclass="other";
		if(cname==name){
			mclass="me";
		}
		$("#messageArea").append("<div class='"+mclass+"'>"+data+"</div>");
	}
	// 서버와 연결을 끊었을 때
	function onClose(evt) {
		$("#messageArea").append("<div class='disconnect'>연결 끊김</div>");

	}
</script>
</html>