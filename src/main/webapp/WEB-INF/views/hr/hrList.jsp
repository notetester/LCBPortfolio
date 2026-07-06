<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 채용공고 게시판</title>

<link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hrList.css">

</head>

<body style="overflow-x:hidden">

	   <%@ include file = "../include/header.jsp" %>
	   <Br><Br><Br>
	   <Br><Br><Br>	  	   
	<div class="all">
		<h2 class="tit">Lcb 상시채용</h2> <br><b class="tit"> 지원서 작성하실때 ..메일 주소 남겨주세요!! </b>
	
		<br>
		<br>
		<form action="hrList" name="searchForm" method="post">  
		<div class="select" width="80%">
			<input type="text" class="searchKey" placeholder="제목으로 검색입니다."
				name=searchKey id="searchKey" value="${cri.searchKey}" style="width: 800px;">
			<button type="submit" class="btn_col2">검색</button>
		</div>
		</form>
		<br><br>
		<div class="mg">
		<select class="amount" onchange="change(this)">
						<option value="10" ${pageVO.amount==10? 'selected':''}>10개 보기</option>
						<option value="15" ${pageVO.amount==15? 'selected':''}>15개 보기</option>
						<option value="20" ${pageVO.amount==20? 'selected':''}>20개 보기</option>
						<option value="50" ${pageVO.amount==50? 'selected':''}>50개 보기</option>
						<option value="100" ${pageVO.amount==100? 'selected':''}>100개 보기</option>					
		</select>
                  
   		<span>총 ${pageVO.total}</span>
   		</div>
   		<div>
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
				
				<c:forEach var="hrVO" items="${hrVO}">
					<tr>
						<td>${hrVO.hrtno}</td>
						<td>${hrVO.writer}</td>
						<td class="text_l">
						<a href="${pageContext.request.contextPath }/hr/hrDetail?hrtno=${hrVO.hrtno}&MEMBERS_ID=${hrVO.writer}">${hrVO.title}</a>
						</td>
						<td><fmt:formatDate value="${hrVO.regdate}" pattern="yyyy-MM-dd hh:mm:ss"/> </td>
					</tr>
				</c:forEach>
			</tbody>
		</table>		
		</div>	
		<br><br><br>
		<form action="hr" name="pageForm" method="post">
		<br><br>
                    <div class="text-center">                    
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
						<button type="button" onclick="location.href='hrRegist'" class="button purple large">이력서 작성 및 제출</button>
					</div>

                    </div>
		    </form>
	</div>
	<br><br><br><br><br>
	<%@ include file = "../include/footer.jsp" %>
	<script>
		(function(){
			
			//console.log(history.state);
			
			/* '<c:out value="${msg}"></c:out>' */
			if(history.state ===''){
				return;
			}
			
			var msg = '${msg}';
			if(msg!=''){
				alert(msg);
				//(추가할 데이터, 페이지 제목, 변경할 주소) - 기존 기록을 삭제하고 새로운 기록을 추가
				//이렇게 추가된 데이터를 history.state로 확인이 가능
				history.replaceState('',null,null); 
			}
			
		})()
		
		
		
		var amount = document.querySelector(".amount").value;
		console.log(amount);
		function change(){			
			amount = event.target.value;
			 var searchKey = document.searchForm.searchKey.value;
			 
			location.href='hrList?pageNum=1&amount='+amount+'&searchKey='+searchKey; 
		}
		
		var page = document.getElementById("page");
		page.onclick = function(){
			 event.preventDefault();						 
			 
			 var pageNum = event.target.dataset.pagenum;			 
			 document.pageForm.pageNum.value = pageNum;			 
			 document.pageForm.submit();
		}		
	</script>
	
</body>
</html>