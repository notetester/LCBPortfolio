<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 공지사항 상세보기</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/noticeDetail.css">
	
</head>
<body>
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">공지사항 상세</h4>

<br>	
<form action="noticeModify" method="post">
<div class="table-wrap mt10">
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
											<input class="form-control" name="tno" value=" ${noticeBoardVO.tno}" readonly>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="writer" id="user_id" class="input-text w150px" value="${noticeBoardVO.writer}" maxlength="15" readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="title" id="title" class="input-text" maxlength="100" value="${noticeBoardVO.title}" readonly></td>
									</tr>
									<tr>
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea style="resize: none"  id="textarea" name="content" rows="10" cols="94" title="내용입력" placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다." class="input-textarea" style="margin-top: 0px; margin-bottom: 0px;" readonly>${noticeBoardVO.content} </textarea>
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
							<button type="submit" class="button purple large">변경</button>
							<button type="button" onclick="notice" class="button purple large">목록</button>
					</div>
						</div>
						</form>
						
					</div>
	
	
<br>
<br>
<br>
<script src="${pageContext.request.contextPath }/resources/js/noticeDetail.js"></script>
<%@ include file = "../include/footer.jsp" %>

</body>
</html>