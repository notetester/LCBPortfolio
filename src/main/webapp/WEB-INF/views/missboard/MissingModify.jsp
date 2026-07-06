<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 분실물 문의 변경</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/MissingModify.css">
</head>
<body>
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">분실물 문의 변경</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>	
<div class="table-wrap mt10">
 <form action="MissingModifyForm" method="post" name ="missingmodifyForm">
						<table class="board-form va-m" >
							<colgroup>
								<col style="width:150px;">
								<col>
								<col style="width:150px;">
								<col>
							</colgroup>
								<tbody>
									<tr>
										<th scope="row"><label for="place">글번호</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="found_number" value="${MissingBoardVO.found_number}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="placename">지점명</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="found_place" value="${MissingBoardVO.found_place}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" maxlength="15" value="${MissingBoardVO.members_id}"  readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="found_title" id="found_title" class="input-text" maxlength="100" value="${MissingBoardVO.found_title}"></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="found_content" style="resize: none" name="found_content"
                           rows="10" cols="97" title="내용입력"
                           
                           class="input-textarea">${MissingBoardVO.found_content}</textarea>
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
							<button type="submit" class="button purple large" id = "updateBtn">변경</button>
							<button type="button" class="button purple large" onclick="location.href='MissingList'">목록</button>
							<button type="button" class="button purple large" id = "deleteBtn">삭제</button>
					</div>
							</form>
						</div>
						
					</div>
					
	
<br>
<br>
<br>
<script src="${pageContext.request.contextPath }/resources/js/MissingModify.js"></script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>