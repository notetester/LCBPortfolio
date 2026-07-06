<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 채용공고 등록</title>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hrRegist.css">
</head>
<body style="overflow-x:hidden">
	<%@ include file="../include/header.jsp"%>
	<br>
	<br>
	<Br>
	<form action="RegistForm" name="RegistForm" method="post">
	<div class="all">
		<h2 class="tit">채용 등록</h2>
		
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
							class="input-text w150px" readonly value="${sessionScope.MEMBERS_ID}" maxlength="15"></td>	
					</tr>
					<tr>
						<th scope="row"><label for="title">제목</label> <em
							class="font-orange">*</em></th>
						<td colspan="3"><input type="text" name="title"
							id="title" class="input-text-2" maxlength="100" value="ex> (지점명: 강남 ,지원할 부서: 스토어/ 이력서 제목:미소지기로 열심히 일하겠습니다.)" ></td>
					</tr>
					<tr class="hr_content">
						<th scope="row"><label for="textarea" >자기소개</label></th>
						<td colspan="3">
							<div class="textarea">
								<textarea id="textarea"  name="content"	rows="11s" cols="98" title="내용입력"	class="input-textarea-2" >${hrVO.content}</textarea>
								<div class="util">
									<b class="count">
										<span id="textareaCnt">0</span> 
									</b>
								</div>
							</div>
						</td>
					</tr>					
				</tbody>
			</table>
			
		</div>
	</div>
	<div class="btn-group pt40">
		<button type="button" id="regist" class="button purple large">지원하기</button>
	</div>
</form>
	<br>
	<br>
	<br>
	<script src="${pageContext.request.contextPath }/resources/js/hrRegist.js"></script>
	<%@ include file="../include/footer.jsp"%>
	
</body>
</html>