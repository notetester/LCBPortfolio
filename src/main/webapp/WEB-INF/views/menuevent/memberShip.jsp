<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">

<meta charset="EUC-KR">
<title>LCB 포인트멤버쉽</title>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/membership.css">

<style>
.point-save, .point-use, .point-birthday {
   margin : 0 auto;
   float : left;   
   border-radius: 10px;
   border: 1px solid  #ebebeb;
   box-sizing: border-box;
   margin: 25px;
   width: 28%;
    height: 250px;
   
}
</style>

</head>
<body>
<%@ include file = "../include/header.jsp" %>



<br><br><Br>
<div class = "all">
<div>
<p class="title"> 멤버십 안내 </p>
<br>
</div>

         <div class=" point">
<br>
            <p class="tit-pr">LCB MEMBERSHIP</p>
               <br>
            <p>현재 보유 포인트 : ${MEMBERS_POINT}p</p>
<br>   
         </div>
   
<br><br>
   <div class ="lol">
   <p>멤버십 혜택</p>
   </div>
   <br id = "pointSavelist">
   <div class="membership" id="memberShip">
      <div class = "box">
      <div class="point-save">
      <br>
         <p class="tit">포인트 적립</p>
<br>
         <p class="txt">
            영화 티켓, 매점 상품 구매 시 등급에 따라<br> 5 ~ 10% 포인트를 적립할 수 있어요
         </p>
<br>
         <div class="btn">
            <a href="#pointSavelist" class="button purple" 
               data-target="#pointSave" title="포인트 적립 상세보기">자세히 보기</a>
         </div>
      </div>

      

      <div class="point-use">
      <br>
         <p class="tit">포인트 사용</p>
<br>
         <p class="txt">
            보유한 포인트로 원하는 영화 보고<br> 팝콘도 구매하세요
         </p>
         
         <br>
         <br>
         <div class="btn">
            <a href="#pointUselist" class="button purple" 
               data-target="#pointUse" title="포인트 사용 상세보기">자세히 보기</a>
         </div>
      </div>

      <div class="point-birthday">
      <br>
         <p class="tit">생일 축하 쿠폰</p>

<br>
         <p class="txt">저희 영화관 회원이라면 누구나 생일 축하 쿠폰을 드려요</p>
         <br>
         <br>
         
         <div class="btn">
            <a href="#birthDayCplist" class="button purple" 
               data-target="#birthDayCp" title="생일 축하 쿠폰 상세보기">자세히 보기</a>
         </div>
      </div>
      
      
   </div> <!-- box end -->
   </div>
   <h3 class="tit mt70" >포인트 적립</h3>
   <br>
   <h4 class="tit">포인트 기본 적립</h4>
   <ul class="dot-list">
                  <li>영화 티켓 구매 시 유료 결제 금액의 <em class="font-gblue">5~10%</em> 적립
                     <ul class="dash-list font-gray">
                        <li>일반회원 : 5% 적립</li>
                        <li>VIP회원 : 10% 적립 (단, VIP 선정 기준은 5%만 반영)</li>
                     </ul>
                  </li>
                  <li id="pointUselist">매점 유료 결제 금액의 <em class="font-gblue">2%</em> 적립</li>
                  <li>결제가 완료된 후 적립 예정 포인트로 적립되며 <em class="font-gblue">영화의 경우 상영일 익일, 매점의 경우 구매일 익일</em> 사용 가능한 포인트(가용 포인트) 로 전환됩니다.</li>
                  <li>회원이 로그인 후 온라인 서비스를 이용 하거나 현장 매표소, 키오스크에서 멤버십 카드 제시 또는 회원임을 확인 할 수 있는 정보를 제공하여야 포인트가 적립됩니다.</li>
                  <li>메가박스 및 제휴사 할인, 포인트 결제 등을 통해 할인 받은 금액을 제외한 실제 고객님께서 현금, 신용카드 등으로 유료 결제한 금액 기준으로 적립됩니다.</li>
                  <li>일부 영화, 상품, 극장, 결제 수단의 경우 적립이 되지 않거나 별도의 적립률이 적용될 수 있으며 상세 내용은 해당 상품, 극장 등에 별도 공지합니다.</li>
                  
                  <li>포인트 적립은 티켓에 노출된 영화 시작 시간 이전까지만 가능하며, 영화 상영 및 매점 상품 구매 이후 사후 적립은 불가능합니다.</li>
               </ul>
   
   <br>
   <br>
   <br><br>
   <h3 class="tit mt70" >포인트 사용</h3>
   <br>
   <h4 class="tit">포인트 사용</h4>
   <li class="lis">적립된 포인트는 사용 가능한 보유포인트 내에서 영화, 매점, 포토카드 상품 구매 시 <span class="font-gblue">상품 정가 전액을 기준</span>으로 포인트를 차감하여 사용할 수 있습니다.</li>
   <div class="table-wrap mt10">
                  <table class="data-table a-c">
                     
                     <colgroup>
                        <col style="width:140px;">
                        <col>
                        <col>
                        <col>
                     </colgroup>
                     <thead>
                        <tr>
                           <th scope="col">회원상품</th>
                           <th scope="col">구분</th>
                           <th scope="col">구포인트</th>
                           <th scope="col">신포인트</th>
                        </tr>
                     </thead>
                     <tbody>
                        <tr >
                           <td rowspan="2">영화</td>
                           <td id="birthDayCplist">사용 가능 요일</td>
                           <td>월~금(공휴일 제외)</td>
                           <td>월~일(요일 무관)</td>
                        </tr>
                        <tr>
                           <td>차감 포인트</td>
                           <td>티켓 정가 100%</td>
                           <td>티켓 정가 100%</td>
                        </tr>
                        <tr>
                           <td rowspan="2">매점</td>
                           <td>사용 가능 상품</td>
                           <td >직원 통해 포인트 차감 → 쿠폰으로 변경 후 사용<br>(오리지널 팝콘 R, 콤보 2천원 할인 쿠폰)</td>
                           <td>매점 전체(일부 상품 제외)</td>
                        </tr>
                        <tr>
                           <td>차감 포인트</td>
                           <td>상품별로 지정</td>
                           <td>매점 상품 정가 100%<br>(업그레이드 금액 제외)</td>
                        </tr>
                        <tr>
                           <td>포토카드</td>
                           <td>차감 포인트</td>
                           <td>1,000 P</td>
                           <td>1,000 P</td>
                        </tr>
                     </tbody>
                  </table>
               </div>
   
   <br>
   <br>
   <br>
   <h3 class="tit mt70" >생일 축하 쿠폰</h3>
   <br>
   <h4 class="tit">생일 축하 쿠폰 증정!</h4>
   <ul class="dot-list">
                  <li>생일 쿠폰은 메가박스 회원에게만 제공됩니다.</li>
                  <li>생일 쿠폰은 1년에 1회 지급되며, 한 번 발급되면 추가 발급되지 않습니다.</li>
                  <li>
                     생일 쿠폰은 회원정보에 등록된 생일을 기준으로 발급됩니다.
                     <ul class="dash-list font-gray">
                        <li >생일 2주전 쿠폰이 발행되며, 유효기간은 발행일로부터 4주입니다. (예 : 3월 16일 생일인 경우 3월 2일 발급, 3월 30일까지 사용 가능)</li>
                     </ul>
                  </li>
                  <li>발행된 쿠폰은 로그인 후 ‘나의 메가박스 &gt; 쿠폰’에서 확인 가능합니다.</li>
                  <li>쿠폰 발급일 기준, 정상 회원에게만 제공됩니다. (쿠폰 발급일 이후 가입, 휴면 회원 상태 고객 등 제외)</li>
                  <li>쿠폰 내용, 지급 일정, 사용 방법 등은 내부 사정에 따라 변경될 수 있습니다.</li>
               </ul>
   </div>
<script src="${pageContext.request.contextPath }/resources/js/membership.js"></script>
<%@ include file="../include/footer.jsp"%>


</body>
</html>