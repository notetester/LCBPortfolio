<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Lcb 마이페이지</title>


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/reset19.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/style19.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/assets/css/swiper.css">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/user_mypage.css">
</head>
<body>
<%@ include file = "../include/header.jsp" %>
    <br><br><br>
			<h2>마이페이지</h2>
			<br><br><br>
    <div class="my-magabox-info ">
        <div class="top">
            <div class="photo" id="myPhoto">
                <div class="wrap">
                    <form name="fileForm" style="display: none;">
                        <input type="file" name="file">
                        <input type="hidden" name="fileMbNo" value="10216371">
                    </form>
                    
                    <i class="iconset ico-add-photo"></i>
                    
                    <button type="button" class="img">
                        <img src="${pageContext.request.contextPath}/resources/img/bg-photo.png" onerror="noImg(this, 'human')">
                    </button>
                </div>
            </div>
            
            <div class="grade">
                <p class="name"> ${sessionScope.MEMBERS_ID} 님은<br>${UserVO.MEMBERS_GRADE }등급입니다.</p>
                
                <div class="link">
                    <a href="${pageContext.request.contextPath }/user/user_update">개인정보수정 <i class="iconset ico-arr-right-reverse"></i></a>
                    
                    
                </div>
            </div>
       </div>
            
            <!-- 바텀 -->
        <div class="bottom">
            <div class="point" id="myPoint">
               
            
            <!-- coupon -->
            <div class="coupon" id="myCoupon">
                <div class="tit-area">
                     <span>구매 티켓</span>&nbsp;&nbsp;&nbsp;
                     <em>${ticket}매</em>    
                   
                </div>
            </div>
            <br><br><br>            
            <div class="kakao">
				<h3>구매 티켓 내게 보내기</h3>
				<br>
				<a id="send-to-btn" href="#" onclick="sendTo()">
			        <img  class ="kakao-img"src="//k.kakaocdn.net/14/dn/btqc6xrxbuT/7VJk7YSWITkz9K9pbXEffk/o.jpg"/>
			    </a>
		    </div>
        </div>
     </div>
   </div>
   <br><br><br>
<section id="help">
      <div class="container">
          <div class="row">
              <div class="help clearfix">
                  <article class="help_box1">
                      <h3><em>1:1문의</em></h3>
                      <div class="QNA" style="position: relative;">
                          <ul>
                              <li class="active"><a href="${pageContext.request.contextPath}/board/notice">전체 문의</a>
                                  <ul  class="q" style="display: block;">
                                  	  <c:forEach var="vo" items="${QNAList}">
                                      <li>
                                          <dl>
                                              <dt><em><fmt:formatDate value="${vo.qna_regdate }" pattern="yyyy-MM-dd hh:mm:ss"/> </em></dt>
                                              <dd><a href="${pageContext.request.contextPath}/board/QNADetail?bno=${vo.qna_number}&MEMBERS_ID=${vo.members_id}">${vo.qna_title}</a></dd>
                                          </dl>            
                                      </li>
                                      </c:forEach>
                                      <li class="text-center" style="border:0px;">
                                      	
						                    <br><br>
						                    <ul class="pagination pagination-sm" id="page1">
						                              <!-- 2. 이전버튼 활성화 여부 -->
						                        <c:if test="${pageVO1.prev }">
						                           <li id="prev1" style="border: 0px; padding: 0px;"><a href="${pageVO1.startPage-1}" data-pagenum="${pageVO1.startPage-1}">이전</a></li>
						                        </c:if>   
						                              <!-- 1. 페이지 번호처리 -->
						                        <c:forEach var="num" begin="${pageVO1.startPage }" end="${pageVO1.endPage }">
						                           <li class="${num == pageVO1.pageNum ? 'active' : '' }" style="border: 0px; padding: 0px;" ><a href="${num}" data-pagenum="${num}">${num }</a></li>
						                           
						                        </c:forEach>
						                              <!-- 3. 다음버튼 활성화 여부 -->
						                        <c:if test="${pageVO1.next }">
						                           <li id="next1" style="border: 0px; padding: 0px;"><a href="${pageVO1.endPage+1}" data-pagenum="${pageVO1.endPage+1}">다음</a></li>
						                        </c:if>
						                    </ul>
                                      
                                      </li>
                                  </ul>
                              </li>                              
                          </ul>
                      </div>
                  </article>
				  <article class="help_box2">
                      <h3><em>분실물문의</em></h3>
                      <div class="Missing" style="position: relative;">
                          <ul>
                              <li class="active"><a href="${pageContext.request.contextPath}/missboard/MissingList">전체 문의</a>
                                  <ul class="m" style="display: block;">
                                  	  <c:forEach var="vo" items="${MissingList}">
                                      <li>
                                          <dl>
                                              <dt><em><fmt:formatDate value="${vo.found_regdate }" pattern="yyyy-MM-dd hh:mm:ss"/> </em></dt>
                                              <dd><a href="${pageContext.request.contextPath}/missboard/MissingDetail?found_number=${vo.found_number}&MEMBERS_ID=${vo.members_id}">${vo.found_title}</a></dd>
                                          </dl>            
                                      </li>
                                      </c:forEach>
                                      
                                       <li class="text-center" style="border:0px;">
                                      	
						                    <br><br>
						                    <ul class="pagination pagination-sm" id="page2">
						                              <!-- 2. 이전버튼 활성화 여부 -->
						                        <c:if test="${pageVO2.prev }">
						                           <li  id="prev1" style="border: 0px; padding: 0px;"><a href="${pageVO2.startPage-1}" data-pagenum="${pageVO2.startPage-1}">이전</a></li>
						                        </c:if>   
						                              <!-- 1. 페이지 번호처리 -->
						                        <c:forEach var="num" begin="${pageVO2.startPage }" end="${pageVO2.endPage }">
						                           <li class="${num == pageVO2.pageNum ? 'active' : '' }" style="border: 0px; padding: 0px;"><a href="${num}" data-pagenum="${num}">${num }</a></li>
						                        </c:forEach>
						                              <!-- 3. 다음버튼 활성화 여부 -->
						                        <c:if test="${pageVO2.next }">
						                           <li id="next2" style="border: 0px; padding: 0px;"><a href="${pageVO2.endPage+1}" data-pagenum="${pageVO2.endPage+1}">다음</a></li>
						                        </c:if>
						                    </ul>
                                      </li>
                                  </ul>
                              </li>                              
                          </ul>
                      </div>
                  </article>
                  <article class="help_box3">
                   <h3><em>구매 내역</em></h3>
   					  <div class="list">
   					  <br><br><br><br>
   					  <ul>    
		                    <li>                              
		                        <ul id="p_history">  
			                        <c:forEach var="vo" items="${HistoryList}">
			                        <li>
			                        	<span>${vo.movie_name}&nbsp;&nbsp;&nbsp;</span>
			                            <span>${vo.reservation_row}${vo.reservation_seat}&nbsp;&nbsp;&nbsp;</span>
			                        </li>
			                        <li>
			                        	<em> <fmt:formatDate value="${vo.start_time}" pattern="yyyy-MM-dd hh:mm"/>~<fmt:formatDate value="${vo.end_time}" pattern="yyyy-MM-dd hh:mm"/></em>
			                        </li>
			                        </c:forEach>
			                     </ul>
			                   <ul>
		                        <li>
		                        	
		                        	<button class="form-control" id="beforeList">결과 내역 이전보기(페이징)</button>		                        	
		                        	
		                        	<button class="form-control" id="moreList">결과 내역 더보기(페이징)</button>
		                        	
		                        </li>
		                      </ul>
		                    </li>
		                    
                 	  </ul>
                 
   					</div>
              	</article>
              </div>
           </div>
        </div>
     </section>
   
   
   <br><br><br>
   <br><br><br>
   <br><br><br>
   
    <br><br><br>
   <script src="${pageContext.request.contextPath }/resources/js/user_mypage.js"></script>
    <%@ include file = "../include/footer.jsp" %>
    </body>
    </html>
    