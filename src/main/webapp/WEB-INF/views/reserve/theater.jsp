<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 극장관</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/theater.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/kakao.js"></script>


</head>
<body>

	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<Br>
	<div class="container">
		
		<h2><strong>극장 찾기</strong></h2>
		<br>
		<div class="theater-box" style="height: 289px;">
			<div class="theater-place">
				<ul>


					<li id="a1" class="on">
						<button type="button" class="sel-city seoul">서울</button>

						<div class="theater-list">
							<ul>

								<li data-brch-no="1372"><a href="#" title="강남" id="gangnam">강남</a>


								</li>


								<li data-brch-no="1212"><a href="#" title="홍대" id="hongdae">홍대</a>


								</li>





							</ul>
						</div>
					</li>

					<li id="a2" class="">
						<button type="button" class="sel-city ilsan">경기</button>

						<div class="theater-list">
							<ul>



								<li data-brch-no="4104"><a href="#" title="일산벨라시타"
									id="bela">일산벨라시타</a></li>


							</ul>
						</div>
					</li>

				<div id = "a3">				
				<div class="box">
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!-- Indicators는 숨어있는 사진 개수 -->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active" style="margin-right: 5px;"></li>
                        <li data-target="#myCarousel" data-slide-to="1" style="margin-left:5px; margin-right: 5px;"></li>
                        <li data-target="#myCarousel" data-slide-to="2" style="margin-left:5px;" ></li>
                    </ol>

                    <!-- Wrapper for slides는 사진 영역 -->
                    <div class="carousel-inner">
                        <div class="item active">							
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/옴팡이.jpg" alt="사진 1" style="width:250%">
                            </a>
                        </div>

                        <div class="item">
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/반도티켓.jpg" alt="사진 4" style="width:250%">
                            </a>
                        </div>

                        <div class="item">
                            <a>
                                <img src="${pageContext.request.contextPath}/resources/img/알라딘티켓.jpg" alt="사진 7" style="width:250%">
                            </a>
                            
                        </div>
                    </div>
                </div>      
                </div>
				</div>
				</ul>
			</div>


			<div class="user-theater"></div>
		</div>


		<br>
		<br>
		<br>
		<br>



		<div class="all" id="all">
			<div class="title">
				<h2><strong>영화관 위치</strong></h2>
			</div>
			<br>
			<br>
			<div id="map" style="width: 500px; height: 400px;"></div>
			<div class="locationText">
			<div class="title">
				<h2 id="moviename" class = "title">영화관이름</h2>
			</div>

				<p>주소 :
				<p id="location"></p>
				<br>
				<br> <br>
				<br>
				<br> <br>
				<br>
				<br> <br>
				<br>
				<button type="button" 					
					class="reserveBtn">예매하러가기</button>

			</div>
		</div>
	</div>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=YOUR_KAKAO_MAP_KEY"></script>
	<script>
			
		var seoul = document.querySelector(".seoul");
		var ilsan = document.querySelector(".ilsan");
		var gangnam = document.querySelector(".gangnam");
		var hongdae = document.querySelector(".hongdae");
		var bela = document.querySelector(".bela");
		
		seoul.onclick = function(){
			
			$("#a1").addClass("on");
			$("#a2").removeClass("on");
			
		}
		
		
		
		ilsan.onclick = function(){
			
			$("#a2").addClass("on");
			$("#a1").removeClass("on");
		}
		
		 $(".theater-list").click(function(){
			if(event.target.title == '강남'){
			 $("#all").css("display","inline");
			 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=10#d1'");
				$("#moviename").html("강남점");
				$("#location").html("강남역 4번출구")
				var x = 37.494593;
			    var y = 127.029584;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">강남점! <br> <a href="https://map.kakao.com/link/to/강남점!,37.494593,127.029584" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			else if(event.target.title == '홍대'){
				 $("#all").css("display","inline");
				 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=11#f1'");
				$("#moviename").html("홍대점");
				$("#location").html("홍대입구역 4번출구")
				var x = 37.558124;
			    var y = 126.925840;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">홍대점! <br> <a href="https://map.kakao.com/link/to/홍대점!,37.558124,126.925840" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			
			else if(event.target.title == '일산벨라시타'){
				 $("#all").css("display","inline");
				 $(".reserveBtn").attr("onclick","onclick=location.href='${pageContext.request.contextPath}/reserve/ticketSchedule?num=12#f2'");
				$("#moviename").html("일산벨라시타점");
				$("#location").html("백석역 3번출구")
				var x = 37.642351;
			    var y = 126.792241;
			    
			   
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng(x, y), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };

			var map = new kakao.maps.Map(mapContainer, mapOption);

			// 마커가 표시될 위치입니다 
			var markerPosition  = new kakao.maps.LatLng(x, y); 

			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition
			});

			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);

			var iwContent = '<div style="padding:5px;">벨라시타점! <br> <a href="https://map.kakao.com/link/to/벨라시타점!,37.642351,126.792241" style="color:blue" target="_blank">길찾기</a></div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			    iwPosition = new kakao.maps.LatLng(x, y); //인포윈도우 표시 위치입니다

			// 인포윈도우를 생성합니다
			var infowindow = new kakao.maps.InfoWindow({
			    position : iwPosition, 
			    content : iwContent 
			});
			  
			// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
			infowindow.open(map, marker); 
			}
			
			
		})	
		</script>


<br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file="../include/footer.jsp"%>
</body>


</html>
