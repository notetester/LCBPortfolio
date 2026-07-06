<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 공지사항 등록</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/noticeRegist.css">
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<Br>
	<form action="noticeRegistForm" method="post">
	<div class="all">
		<h2 class="tit">공지사항 등록</h2>
		
		<br>
		
		<div class="table-wrap mt10">
		  	
			<table class="board-form va-m">
				<colgroup>
					<col style="width: 150px;">
					<col>
					<col style="width: 150px;">
					<col>
				</colgroup>
				<tbody>					
					<tr>
						<th scope="row"><label for="name">아이디</label> <em
							class="font-orange">*</em></th>
						<td colspan="3"><input type="text"  name="userId" id="userId"
							class="input-text w150px" readonly value="${sessionScope.MEMBERS_ID }" maxlength="15"></td>
					</tr>
					<tr>
						<th scope="row"><label for="title">제목</label> <em
							class="font-orange">*</em></th>
						<td colspan="3"><input type="text" name="title"
							id="title" class="input-text" maxlength="100"></td>
					</tr>
					<tr>
						<th scope="row"><label for="textarea">내용</label> <em
							class="font-orange">*</em></th>
						<td colspan="3">
							<div class="textarea">
								<textarea id="content" style="resize: none" name="content"
									rows="10" cols="98" title="내용입력"								
	
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
			
		</div>
	</div>
	<div class="btn-group pt40">
		<button type="submit" class="button purple large">등록</button>
	</div>
</form>
	<br>
	<br>
	<br>
	
	<script src="${pageContext.request.contextPath }/resources/js/noticeRegist.js"></script>
	
	<%@ include file="../include/footer.jsp"%>
</body>
</html>