<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 분실물 문의 게시판</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/MissingList.css">
</head>

<body>
	   <%@ include file = "../include/header.jsp" %>
	   <Br><Br><Br>
	<div class="all">
	<Br><Br><Br>
		<h2 class="tit">분실물 문의 게시판</h2>
		<br>
		<br>
		<form action = "MissingList">
		<div class="select" width="80%">
			<input type="text" class="searchkey" placeholder="제목을 입력해주세요."
				id="searchKeyword" name="searchKey" style="width: 800px;">
			<button type="submit" class="btn_col2">검색</button>
		</div>
		</form>
		<table class="tbl_list text_c" summary="분실물 검색내용에 대한 표입니다">
			<br><br>
			<colgroup>
				<col style="width: 10%;">
				<col style="width: 15%;">
				<col style="width: auto;">
				<col style="width: 15%;">
			</colgroup>
			<thead>
				<tr>
					<th scope="col">번호</th>
					<th scope="col">작성자</th>
					<th scope="col">제목</th>
					<th scope="col">등록일</th>
				</tr>
			</thead>
			<tbody>
			
				
				<c:forEach var="vo" items="${MissingBoardList}" >
	         	<tr>
	                <td>${vo.found_number}</td>
	                <td>${vo.members_id}</td>
	                <td><a href="MissingDetail?found_number=${vo.found_number}&MEMBERS_ID=${vo.members_id}">${vo.found_title}</a></td>
	                <td><fmt:formatDate value="${vo.found_regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></td>
	            </tr>
                </c:forEach>
                            
			
			</tbody>
		</table>
		
		<form action="MissingList" name="pageForm" method="post">
                    <div class="text-center">
                    <br><br>
                    <ul class="pagination pagination-sm" id="page">
                              <!-- 2. 이전버튼 활성화 여부 -->
                        <c:if test="${pageVO.prev }">
                           <li><a href="${pageVO.startPage-1}" data-pagenum="${pageVO.startPage-1}">이전</a></li>
                        </c:if>   
                              <!-- 1. 페이지 번호처리 -->
                        <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">
                           <li class="${num == pageVO.pageNum ? 'active' : '' }"><a href="${num}" data-pagenum="${num}">${num }</a></li>
                        </c:forEach>
                              <!-- 3. 다음버튼 활성화 여부 -->
                        <c:if test="${pageVO.next }">
                           <li><a href="${pageVO.endPage+1}" data-pagenum="${pageVO.endPage+1}">다음</a></li>
                        </c:if>
                    </ul>
                    
                    <!-- 페이징 클릭시 숨겨서 보낼 값 -->
                    <input type="hidden" name="pageNum" value="${cri.pageNum}">
                    <input type="hidden" name="amount" value="${cri.amount}">
                    <input type="hidden" name="searchKey" value="${cri.searchKey}">
                    <div class="btn-group pt40">
                  <button type="button" onclick="location.href='MissingRegist'" class="button purple large" >글 쓰기</button>
               </div>

               
               </div>
          </form>
               

                    </div>
		
	
			
		   
	
	<br><br><br><br><br>
	<%@ include file = "../include/footer.jsp" %>
</body>
<script>
$(document).ready(function(){
	(function(){
		if(history.state ===''){
			return;
		}
		var msg="${msg}";
		if(msg!=''){
			alert(msg);
			history.replaceState('',null,null); 
		}
	})();
})
var page = document.getElementById("page");
page.onclick = function(){
    event.preventDefault();                   
    
    var pageNum = event.target.dataset.pagenum;          
    document.pageForm.pageNum.value = pageNum;          
    document.pageForm.submit();
}


</script>
</html>