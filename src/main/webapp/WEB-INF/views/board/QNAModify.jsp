<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 1:1 문의 수정</title>
<script src = "${pageContext.request.contextPath }/resources/js/jquery-3.5.1.min.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/QNAModify.css">
</head>
<body>
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">1:1 문의글 변경페이지</h4>

<li>1:1 문의글 답변 운영시간 09:00 ~ 21:00</li>
<br>	
<div class="table-wrap mt10">
 <form action="ModifyForm" method="post" name ="modifyForm">
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
											<input class="form-control" name="qna_number" value="${QNABoardVO.qna_number}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="placename">지점명</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<input class="form-control" name="qna_place" value="${QNABoardVO.qna_place}" readonly >
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="members_id" id="members_id" class="input-text w150px" maxlength="15" value="${QNABoardVO.members_id}"  readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="qna_title" id="qna_title" class="input-text" maxlength="100" value="${QNABoardVO.qna_title}"></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="qna_content" style="resize: none" name="qna_content"
                           rows="10" cols="83" title="내용입력"
                           
                           class="input-textarea">${QNABoardVO.qna_content}</textarea>
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
							<button type="button" class="button purple large" onclick="location.href='QNAList'">목록</button>
							<button type="button" class="button purple large" id = "deleteBtn">삭제</button>
					</div>
							</form>
						</div>
						
					</div>
	
	
<br>
<br>
<br>
<script src="${pageContext.request.contextPath }/resources/js/QNAModify.js"></script>
<%@ include file = "../include/footer.jsp" %>
</body>
</html>