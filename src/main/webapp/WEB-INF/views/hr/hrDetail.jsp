<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 채용 공고 상세보기</title>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hrDetail.css">
</head>
<body style="overflow-x:hidden">
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">채용 상세정보</h4>

<br>	
<form action="hrModify" method="post">
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
											<input class="form-control" name="hrtno" value=" ${hrVO.hrtno}" readonly>
										</td>
									</tr>
									<tr>
										<th scope="row"><label for="ID">ID</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="writer" id="user_id" class="input-text w150px" value="${hrVO.writer}" maxlength="15" readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="title" id="title" class="input-text-2" maxlength="100" value="${hrVO.title}" readonly></td>
									</tr>
									<tr class="hr_content">
										<th scope="row"><label for="textarea">내용</label> <em class="font-orange">*</em></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="textarea" style="height:300px ;resize: none ;margin-top: 0px; margin-bottom: 0px;"  name="content" rows="10" cols="94" title="내용입력" placeholder="※ 불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다." class="input-textarea" readonly>${hrVO.content} </textarea>
											<div class="util">
												<p class="count">
													<span id="textareaCnt">0</span>
												</p>
											</div>
										</div>
										</td>
									</tr>
								</tbody>
							</table>
							<div class="btn-group pt40">
							<button type="submit" class="button purple large">변경</button>
							<button type="button" onclick="location.href='hrList'" class="button purple large">목록</button>
					</div>
						</div>
						</form>
						
					</div>
	
	
<br>
<br>
<br>
<script src="${pageContext.request.contextPath }/resources/js/hrModify.js"></script>
<%@ include file = "../include/footer.jsp" %>

</body>
</html>