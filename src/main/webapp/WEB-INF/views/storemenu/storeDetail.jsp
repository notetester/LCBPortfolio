<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 스토어 상세화면</title>
<!--  부트스트렙 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@700&display=swap"
	rel="stylesheet">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/storeDetail.css">




</head>

<body>
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<br>
	<div id="contents" class="">
		<div class="inner-wrap">

			<!-- store-view -->
			<div class="store-view">
				<h2 id="tit1"></h2>
				<div class="sub-info">
					<p id="tit2"></p>
				</div>

				<!-- box-store-view -->
				<div class="box-store-view">
					<div class="left">
						<div class="img">
							<p>
								<img id="image"
									src="" >
							</p>
						</div>
						<p class="origin"><!-- 원산지 : 팝콘: 옥수수-미국산, 오징어: 몸/다리-외국산) --></p>
					</div>

					<!-- right -->
					<div class="right">
						<!-- goods-info -->
						<div class="goods-info">
							<p id="content1"></p>
						</div>
						<!--// goods-info -->

						<!--
                            판매종료일때는 각 select, button 에 disabled 처리
                        -->
						<!-- type -->
						<div class="type">
							<!-- 수량 금액 일 때 -->

							<!--// 수량 금액 일 때 -->

							<!-- 기프트카드  -->

							<div class="receipt">


								<div class="line">
									<p class="tit">
										<span class="line32"><b>수량/금액</b></span>
									</p>


									<div class="cont">
										 <button type="button" class="btn minus" id="minus" title="수량감소">
											<i class="iconset ico-minus"></i>
										</button>
										<input type="text" title="수량 입력" class="input-text"
											readonly="readonly" value="1" id="result">
										<button type="button" class="btn plus" id="plus" title="수량증가">
											<i class="iconset ico-plus"></i>
										</button>										
 
										<div class="money">
											<em id="prdtSumAmt"></em> <span>원</span>


										</div>
									</div>
									


								</div>
							</div>
						</div>
						<!--// type -->

						<div class="btn-group">
							<a href="#" id="payBtn"
								class="button purple large" w-data="500" h-data="410" title="구매">구매</a>
						</div>
					</div>
					<!--// right -->
				</div>
				<!--// box-store-view -->
			</div>
			<!--// store-view -->

			<!-- 레이어 : 극장확인 -->
			<section id="layer_chk01" class="modal-layer"></section>
			<!--// 레이어 : 극장확인 -->

			<!-- 레이어 : 지점확인 -->
			<section id="layer_chk02" class="modal-layer"></section>
			<!--// 레이어 : 지점확인 -->

			<!-- 레이어 : 취소불가 -->
			<section id="layer_chk03" class="modal-layer"></section>
			<!--// 레이어 : 지점확인 -->


			<!-- box-pulldown -->
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" id="a1" class="btn-toggle">
						구매 후 취소 <i class="iconset ico-arr-toggle-down"></i>
					</button>
				</div>

				<div id="a2" class="cont">
				

				</div>
			</div>
			<!--// box-pulldown -->

			<!-- box-pulldown -->
			<div class="box-pulldown">
				<div class="tit">
					<button type="button" id="a3" class="btn-toggle">
						상품이용안내 <i class="iconset ico-arr-toggle-down"></i>
					</button>
				</div>

				<div id="a4" class="cont">

					

				</div>
			</div>
			<!--// box-pulldown -->


		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<%@ include file="../include/footer.jsp"%>

	<script>
	
	var price;
	$(document).ready(function(){
		
		$.getJSON("${pageContext.request.contextPath}/storemenu/getList/${pno}",
				function(data){  
				console.log(data)
				$("#tit1").html(data.popcorn_TITLE1);
				$("#tit2").html(data.popcorn_TITLE2);
				$("#content1").html(data.popcorn_CONTENT1);
				$("#a2").html(data.popcorn_CONTENT2);
				$("#a4").html(data.popcorn_CONTENT3);
				$("#image").attr("src",data.popcorn_IMAGE);
				$("#prdtSumAmt").html(data.popcorn_PRICE);
				price=data.popcorn_PRICE;
		})
		
		
	})
	



	
var IMP = window.IMP; // 생략가능
IMP.init('iamport'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용

var payBtn= document.getElementById("payBtn");



payBtn.onclick=function(){

   
IMP.request_pay({
    pg : 'inicis', // version 1.1.0부터 지원.
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명: Lcb 일반영화권(어른) ',
    amount : $("#prdtSumAmt").html(),
    buyer_email : 'magadan0617@naver.com',
    buyer_name : '한건희',
    buyer_tel : '010-2616-3248',
    buyer_addr : '서울특별시 강남구 역삼동 제이슨 타워',
    buyer_postcode : '123-456',
    m_redirect_url : 'https://www.yourdomain.com/payments/complete'
}, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        msg += '고유ID : ' + rsp.imp_uid;
        msg += '상점 거래ID : ' + rsp.merchant_uid;
        msg += '결제 금액 : ' + rsp.paid_amount;
        msg += '카드 승인번호 : ' + rsp.apply_num;
    } else {
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    alert(msg);
});
   
}




			
			var result = document.getElementById("result"); // result 창 
			var plus = document.getElementById("plus"); 
			var minus = document.getElementById("minus");  
			plus.onclick = function(){
				
				if (result.value >= 8) {
					alert("수량이 8개 이상 할 수 없습니다. ");
					return;
				} else {
					result.value++;// 1씩 증가
					console.log(result.value);
					console.log(price);
					$("#prdtSumAmt").html(result.value * price);
				}
			} 
			
			minus.onclick=function(){ //- button일때

				if (result.value <= 1) { // 0보다 작을 경우 내려가지 않게 함
					alert("1보다 작을 수 없습니다.");
					return;
				} else {
					result.value--; // 1씩 감소
					$("#prdtSumAmt").html(result.value * price);
				}
			}
			   
			     var toggle1=true;
			      $("#a1").click(function(){
			    	if(toggle1){
			    		$("#a2").css("display","table-row")
			    		toggle1=false;
			    	}else {
			    		$("#a2").css("display","none")
			    		toggle1=true;
			    	}
			    	  
			      })
			      
			       var toggle2=true;
			      $("#a3").click(function(){
			    	if(toggle2){
			    		$("#a4").css("display","table-row")
			    		toggle2=false;
			    	}else {
			    		$("#a4").css("display","none")
			    		toggle2=true;
			    	}
			    	  
			      })
			      
			      
			   </script>

</body>

</html>