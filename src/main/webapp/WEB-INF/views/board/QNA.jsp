<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB QNA 등록</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/QNA.css">
</head>
<body>
<%@ include file = "../include/header.jsp" %>
<br><br><Br>
<div class ="all">

<h4 class="tit">1:1 문의</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>   
<div class="table-wrap mt10">
                <form action ="QNARegist" method = "POST" name="QNARegistForm">
                  <table class="board-form va-m" >
                     <colgroup>
                        <col style="width:150px;">
                        <col>
                        <col style="width:150px;">
                        <col>
                     </colgroup>
                        <tbody>
                           <tr>
                              <th scope="row"><label for="place">문의지점</label> <em class="font-orange">*</em></th>
                              <td colspan="3">
                                 
                                 <select id="qna_place" title="극장선택" class="small ml07"name = "qna_place">
                                    
                                 <option value="극장선택" selected >극장선택</option><option value="강남">강남</option><option value="홍대">홍대</option><option value="일산">일산</option>
                                 
                                 </select>
                              </td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
                              <td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" readonly value="${sessionScope.MEMBERS_ID }" maxlength="15"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="hpNum1">연락처</label> <em class="font-orange">*</em></th>
                              <td>
                                 
                                     
                                    
                                       <input type="text" name="qna_hpnum1" id="qna_hpnum1" size="3" class="input-text w60px numType" maxlength="3" title="핸드폰번호 첫자리 입력">
                                       <span>-</span>
                                       <input type="text" name="qna_hpnum2" id="qna_hpnum2"size="4" class="input-text w60px numType" maxlength="4" title="핸드폰번호 중간자리 입력">
                                       <span>-</span>
                                       <input type="text" name="qna_hpnum3" id="qna_hpnum3"size="4" class="input-text w60px numType" maxlength="4" title="핸드폰번호 마지막자리 입력">
                                    
                                 
                              </td>
                              <th scope="row"><label for="email">이메일</label> <em class="font-orange">*</em></th>
                              <td><input type="text" name="qna_email" id="qna_email" class="input-text" value="" autocomplete="new-password" maxlength="50"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
                              <td colspan="3"><input type="text" name="qna_title" id="title" class="input-text" maxlength="100"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
                              <td colspan="3">
                                 <div class="textarea">
                                 <textarea id="content" style="resize: none" name="qna_content"
                           rows="10" cols="95" title="내용입력"
                          
                           class="input-textarea"></textarea>
                                 <div class="util">
                                    <p class="count">
                                       <span id="textareaCnt">0</span> / 2000
                                    </p>
                                 </div>
                              </div>
                              </td>
                           </tr>
	                    
                           
                        </tbody>
                     </table>
                     <div class="btn-group pt40">
                  <button type="button" class="button purple large" id ="QNAregistBtn">등록</button>
               </div>
                     </form>
                  </div>
                  
               </div>
   


<br>
<br>
<br>
<script src="${pageContext.request.contextPath }/resources/js/QNA.js"></script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>