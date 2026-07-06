<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LCB 채용공고 수정</title>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.5.1.js"></script>
	<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">
	<link rel="icon" href="${pageContext.request.contextPath }/resources/assets/icons/favicon_LCB.ico">

    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hrModify.css">
</head>



<body style="overflow-x:hidden">
<%@ include file = "../include/header.jsp" %>

<br><br><Br>
<div class ="all">

<h4 class="tit">지원서 수정</h4>

<br>	
<form action="hrUpdate" method="post">
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
										<td colspan="3"><input type="text" name="writer" id="writer" class="input-text w150px" value="${hrVO.writer}" maxlength="15" readonly></td>
									</tr>
									
									<tr>
										<th scope="row"><label for="title">제목</label> <em class="font-orange">*</em></th>
										<td colspan="3"><input type="text" name="title" id="title" class="input-text-2" maxlength="100" value="${hrVO.title}" ></td>
									</tr>
									<tr class="hr_content">
										<th scope="row"><label for="textarea">자기소개 </label></th>
										<td colspan="3">
											<div class="textarea">
											<textarea id="textarea" name="content" rows="10" cols="98" title="내용입력" placeholder="※ 여기는 Lcb 구직하는 곳 입니다." class="input-textarea-2"  >${hrVO.content} </textarea>
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
							<div class="btn-group pt40">
							<button type="submit" class="button purple-1 large">이력서 완료하기</button>
							<button type="button" onclick="location.href='hrRegist'" class="button purple-2 large">새이력서 작성하기</button>
							<button type="button" onclick="location.href='hrDelete?hrtno=${hrVO.hrtno}'" class="button purple-3 large">이력서 삭제하기</button>
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